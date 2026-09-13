import sys
import os
from pathlib import Path
import typst

def compile_typ(input_path: str, output_path: str = None):
    p_in = Path(input_path).resolve()
    if not p_in.exists():
        print(f"Error: {p_in} does not exist.")
        sys.exit(1)
    
    if output_path is None:
        p_out = p_in.with_suffix(".pdf")
    else:
        p_out = Path(output_path).resolve()
    
    print(f"Compiling {p_in.name} -> {p_out.name}...")
    typst.compile(str(p_in), output=str(p_out))
    print(f"✅ Compilation successful: {p_out} ({p_out.stat().st_size} bytes)")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python compile_typst.py <file.typ> [output.pdf]")
        sys.exit(1)
    in_file = sys.argv[1]
    out_file = sys.argv[2] if len(sys.argv) > 2 else None
    compile_typ(in_file, out_file)
