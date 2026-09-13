import fs from 'fs';
import path from 'path';
import { CONFIG, ensureDirectories } from '../dist/config.js';
import { AuthManager } from '../dist/auth/auth-manager.js';

// Ensure config and data directories exist
ensureDirectories();

const cookiesTxtPath = path.resolve('cookies.txt');
if (!fs.existsSync(cookiesTxtPath)) {
  console.error('cookies.txt not found!');
  process.exit(1);
}

const raw = fs.readFileSync(cookiesTxtPath, 'utf8').trim();
const cookiePairs = raw.split(';').map(s => s.trim()).filter(Boolean);

const cookies = [];
const expires = Math.floor(Date.now() / 1000) + 365 * 24 * 60 * 60; // 1 year in future

for (const pair of cookiePairs) {
  const eqIdx = pair.indexOf('=');
  if (eqIdx === -1) continue;
  const name = pair.slice(0, eqIdx).trim();
  const value = pair.slice(eqIdx + 1).trim();

  // Determine domain
  let domain = '.google.com';
  if (name.startsWith('__Host-')) {
    domain = 'google.com';
  }

  cookies.push({
    name,
    value,
    domain,
    path: '/',
    expires,
    httpOnly: name.includes('SID') || name.includes('APISID') || name.includes('OSID'),
    secure: name.startsWith('__Secure-') || name.startsWith('__Host-') || ['SID', 'HSID', 'SSID', 'APISID', 'SAPISID'].includes(name),
    sameSite: name.startsWith('__Secure-3P') ? 'None' : 'Lax'
  });

  // For OSID and __Secure-OSID, also add notebooklm.google.com and notebook.google.com
  if (name === 'OSID' || name === '__Secure-OSID') {
    cookies.push({
      name,
      value,
      domain: 'notebooklm.google.com',
      path: '/',
      expires,
      httpOnly: true,
      secure: true,
      sameSite: 'Lax'
    });
    cookies.push({
      name,
      value,
      domain: 'notebook.google.com',
      path: '/',
      expires,
      httpOnly: true,
      secure: true,
      sameSite: 'Lax'
    });
  }
}

const stateDir = CONFIG.browserStateDir;
if (!fs.existsSync(stateDir)) {
  fs.mkdirSync(stateDir, { recursive: true });
}

const stateFilePath = path.join(stateDir, 'state.json');
const stateData = {
  cookies,
  origins: []
};

fs.writeFileSync(stateFilePath, JSON.stringify(stateData, null, 2), 'utf8');
console.log(`Successfully written ${cookies.length} cookies to ${stateFilePath}`);

// Validate with AuthManager
const authManager = new AuthManager();
const validPath = await authManager.getValidStatePath();
console.log('Valid state path returned by AuthManager:', validPath);
if (validPath) {
  console.log('✅ Authentication state is VALID and ready for Node/TypeScript MCP!');
} else {
  console.log('⚠️ State path could not be validated.');
}
