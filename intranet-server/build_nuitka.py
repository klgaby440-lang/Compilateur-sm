import os
import subprocess
import sys

def compile_intranet_server():
    print("🚀 Lancement de la compilation Nuitka pour le serveur Intranet ClassNet...")
    
    cmd = [
        sys.executable, "-m", "nuitka",
        "--standalone",
        "--mingw64",
        "--include-package=fastapi",
        "--include-package=uvicorn",
        "--include-package=pydantic",
        "--output-dir=dist_nuitka",
        "server_intranet.py"
    ]
    
    result = subprocess.run(cmd)
    if result.returncode == 0:
        print("✅ Compilation Nuitka réussie avec succès ! L'exécutable est prêt.")
    else:
        print("❌ Erreur critique lors de la compilation Nuitka.")
        sys.exit(1)

if __name__ == "__main__":
    compile_intranet_server()
