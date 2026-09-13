import os
import re
from pathlib import Path
import typst

TEMPLATE_HEADER = """#set document(
  title: "{title}",
  author: "Cátedra GRH III"
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.2cm, right: 2.2cm),
  header: context {{
    let page_num = counter(page).get().first()
    if page_num > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8.5pt, fill: rgb("#4a5568"), font: "Liberation Sans", weight: "medium")[
          {short_title} · *Unidad 1: Planificación Estratégica*
        ],
        text(size: 8.5pt, fill: rgb("#718096"), font: "Liberation Sans")[
          GRH III · 2025
        ]
      )
      #v(-2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e0"))
    ]
  }},
  footer: context {{
    let page_num = counter(page).get().first()
    if page_num > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
      #v(2pt)
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8pt, fill: rgb("#a0aec0"))[
          Facultad de Ciencias Económicas · Cátedra GRH III
        ],
        text(size: 8.5pt, fill: rgb("#4a5568"), weight: "bold")[
          #counter(page).display("1 / 1", both: true)
        ]
      )
    ]
  }}
)

#set text(
  font: ("Liberation Sans", "DejaVu Sans", "Arial"),
  size: 10.5pt,
  lang: "es",
  fill: rgb("#2d3748")
)

#set par(
  justify: true,
  leading: 0.75em
)

#let c-primary = rgb("#1a365d")
#let c-secondary = rgb("#2b6cb0")
#let c-accent = rgb("#319795")
#let c-bg-callout = rgb("#ebf8ff")
#let c-border-callout = rgb("#3182ce")
#let c-bg-warn = rgb("#fffaf0")
#let c-border-warn = rgb("#dd6b20")

#let callout(title: "", body, icon: "📌") = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-callout,
    stroke: (left: 4pt + c-border-callout, rest: 0.5pt + rgb("#bee3f8")),
    radius: (right: 4pt),
    inset: (x: 14pt, y: 10pt)
  )[
    #if title != "" [
      #text(weight: "bold", size: 10.5pt, fill: c-secondary)[#icon #title] \\
      #v(4pt)
    ]
    #text(size: 9.8pt, fill: rgb("#2d3748"))[#body]
  ]
  #v(8pt)
]

#let tip-parcial(title: "Tip de Cátedra para el Parcial", body) = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-warn,
    stroke: (left: 4pt + c-border-warn, rest: 0.5pt + rgb("#fbd38d")),
    radius: (right: 4pt),
    inset: (x: 14pt, y: 10pt)
  )[
    #text(weight: "bold", size: 10.5pt, fill: c-border-warn)[⚠️ #title] \\
    #v(4pt)
    #text(size: 9.8pt, fill: rgb("#744210"))[#body]
  ]
  #v(8pt)
]

#show heading.where(level: 1): it => [
  #v(14pt)
  #text(fill: c-primary, weight: "bold", size: 16pt)[#it.body]
  #v(4pt)
  #line(length: 100%, stroke: 2pt + c-secondary)
  #v(10pt)
]

#show heading.where(level: 2): it => [
  #v(10pt)
  #text(fill: c-secondary, weight: "bold", size: 12.5pt)[#it.body]
  #v(5pt)
]

#show heading.where(level: 3): it => [
  #v(8pt)
  #text(fill: c-accent, weight: "bold", size: 11pt)[#it.body]
  #v(4pt)
]

"""

def md_to_typ(content: str, title: str, short_title: str) -> str:
    # Replace markdown headings
    lines = content.splitlines()
    new_lines = []
    for line in lines:
        if line.startswith("# "):
            new_lines.append(f"= {line[2:].strip()}")
        elif line.startswith("## "):
            new_lines.append(f"== {line[3:].strip()}")
        elif line.startswith("### "):
            new_lines.append(f"=== {line[4:].strip()}")
        elif line.startswith("#### "):
            new_lines.append(f"==== {line[5:].strip()}")
        elif line.startswith("> "):
            new_lines.append(f"#callout(title: \"Cita / Definición\")[{line[2:].strip()}]")
        else:
            new_lines.append(line)
    
    body = "\n".join(new_lines)
    header = TEMPLATE_HEADER.format(title=title, short_title=short_title)
    return header + body

u1_dir = Path("Recursos Humanos 3/Unidad 1")
md_files = sorted(u1_dir.glob("0*.md"))

for mf in md_files:
    content = mf.read_text(encoding="utf-8")
    first_line = content.splitlines()[0] if content else mf.stem
    title = re.sub(r'^[#\s📘*]+', '', first_line).strip()
    short_title = title.split("—")[0].strip() if "—" in title else title[:30]
    
    typ_content = md_to_typ(content, title, short_title)
    tf = mf.with_suffix(".typ")
    tf.write_text(typ_content, encoding="utf-8")
    
    pdf_file = mf.with_suffix(".pdf")
    try:
        typst.compile(str(tf), output=str(pdf_file))
        print(f"Generated {pdf_file.name} ({pdf_file.stat().st_size} bytes)")
    except Exception as e:
        print(f"Error compiling {tf.name}: {e}")

print("All individual PDFs generated!")
