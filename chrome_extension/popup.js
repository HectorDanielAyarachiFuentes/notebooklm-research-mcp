import {
  CRITICAL_COOKIE_NAMES,
  toCookieHeader,
  toPlaywrightStorageState,
  validateExtractedCookies,
} from "./cookie-utils.js";

const AUTO_MODE_STORAGE_KEY = "nlm_sync_auto_mode";

function setStatus(kind, message) {
  const statusEl = document.getElementById("status");
  statusEl.className = `status ${kind}`;
  statusEl.textContent = message;
}

function setButtonsEnabled(enabled) {
  for (const id of ["copyStateBtn", "downloadStateBtn", "copyHeaderBtn"]) {
    document.getElementById(id).disabled = !enabled;
  }
}

async function copyTextWithFallback(text) {
  if (navigator.clipboard && typeof navigator.clipboard.writeText === "function") {
    try {
      await navigator.clipboard.writeText(text);
      return true;
    } catch {
      // Fallback for popup initialization without user gesture focus
    }
  }

  const textarea = document.createElement("textarea");
  textarea.value = text;
  textarea.setAttribute("readonly", "");
  textarea.style.position = "fixed";
  textarea.style.opacity = "0";
  textarea.style.left = "-9999px";
  document.body.appendChild(textarea);
  textarea.select();
  let ok = false;
  try {
    ok = document.execCommand("copy");
  } catch {
    ok = false;
  } finally {
    document.body.removeChild(textarea);
  }
  return ok;
}

async function collectNotebookLmCookies() {
  const [googleCookies, nlmUrlCookies, nbUrlCookies, accountsUrlCookies] = await Promise.all([
    chrome.cookies.getAll({ domain: "google.com" }),
    chrome.cookies.getAll({ url: "https://notebooklm.google.com/" }),
    chrome.cookies.getAll({ url: "https://notebook.google.com/" }),
    chrome.cookies.getAll({ url: "https://accounts.google.com/" }),
  ]);

  const rawCookies = [
    ...googleCookies,
    ...accountsUrlCookies,
    ...nbUrlCookies,
    ...nlmUrlCookies,
  ];
  const validation = validateExtractedCookies(rawCookies);
  const storageState = toPlaywrightStorageState(rawCookies);
  const headerString = toCookieHeader(rawCookies);

  return {
    validation,
    storageState,
    stateJsonString: JSON.stringify(storageState, null, 2),
    headerString,
  };
}

function renderStats(validation) {
  const countEl = document.getElementById("count");
  const detailsEl = document.getElementById("details");
  countEl.textContent =
    `${validation.presentCritical.length}/${CRITICAL_COOKIE_NAMES.length} cookies críticas • ` +
    `${validation.totalCookies} cookies con alcance/flags preservados`;

  if (validation.missingCritical.length > 0) {
    detailsEl.textContent = `Faltantes: ${validation.missingCritical.join(", ")}`;
  } else {
    detailsEl.textContent = "Todas las cookies críticas de Google + NotebookLM están presentes.";
  }
}

function downloadStateFile(stateJsonString) {
  const blob = new Blob([stateJsonString], { type: "application/json" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = "state.json";
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}

async function handleAction(mode, fromAutoOpen = false) {
  try {
    const extracted = await collectNotebookLmCookies();
    const { validation } = extracted;
    renderStats(validation);

    if (!validation.hasCoreGoogleAuth) {
      setButtonsEnabled(false);
      setStatus(
        "error",
        `Falta sesión activa de Google (${validation.missingCore.join(", ")}). Abre notebooklm.google.com e inicia sesión primero.`
      );
      return;
    }

    setButtonsEnabled(true);

    if (mode === "manual") {
      if (!validation.hasNotebookLmCookies) {
        setStatus(
          "warning",
          "Sesión Google detectada, pero faltan cookies OSID/__Secure-OSID. Abre notebooklm.google.com y recarga antes de exportar."
        );
      } else {
        setStatus("success", "Sesión válida lista. Elige copiar o guardar state.json.");
      }
      return;
    }

    if (mode === "download") {
      downloadStateFile(extracted.stateJsonString);
      setStatus(
        validation.isReadyForNotebookLm ? "success" : "warning",
        validation.isReadyForNotebookLm
          ? "state.json descargado. Importa con: node scripts/import_cookies.js state.json"
          : "state.json descargado con advertencia: faltan OSID/__Secure-OSID (abre notebooklm.google.com)."
      );
      return;
    }

    const payload = mode === "header" ? extracted.headerString : extracted.stateJsonString;
    const copied = await copyTextWithFallback(payload);

    if (!copied) {
      setStatus(
        "warning",
        fromAutoOpen
          ? "No se pudo auto-copiar sin foco. Haz clic en el botón deseado para copiar al portapapeles."
          : "No se pudo escribir en el portapapeles; usa 'Guardar state.json'."
      );
      return;
    }

    if (!validation.hasNotebookLmCookies) {
      setStatus(
        "warning",
        `Copiado (${mode === "header" ? "Header" : "state.json"}), pero faltan OSID/__Secure-OSID. Visita notebooklm.google.com si falla la conexión.`
      );
      return;
    }

    if (mode === "header") {
      setStatus(
        "success",
        "Header Cookie copiado para scripts legacy (auth_helper.py / cookies.txt)."
      );
    } else {
      setStatus(
        "success",
        "state.json copiado al portapapeles. Ejecuta: node scripts/import_cookies.js --clipboard"
      );
    }
  } catch (err) {
    setStatus("error", `Error al extraer cookies: ${err.message}`);
  }
}

function initPopup() {
  const autoSelect = document.getElementById("autoMode");
  const savedMode = localStorage.getItem(AUTO_MODE_STORAGE_KEY) || "state_json";
  autoSelect.value = savedMode;

  autoSelect.addEventListener("change", () => {
    localStorage.setItem(AUTO_MODE_STORAGE_KEY, autoSelect.value);
  });

  document.getElementById("copyStateBtn").addEventListener("click", () => {
    void handleAction("state_json", false);
  });
  document.getElementById("downloadStateBtn").addEventListener("click", () => {
    void handleAction("download", false);
  });
  document.getElementById("copyHeaderBtn").addEventListener("click", () => {
    void handleAction("header", false);
  });

  void handleAction(savedMode, true);
}

initPopup();
