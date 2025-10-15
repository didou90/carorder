# Utiliser Python 3.12
FROM python:3.12.2-slim

# Créer le répertoire de travail
WORKDIR /app

# Copier les fichiers
COPY . /app

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port 8000
EXPOSE 8000

# Lancer Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
