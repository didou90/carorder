FROM python:3.12-slim

# Installer toutes les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    gcc \
    pkg-config \
    libpq-dev \
    default-libmysqlclient-dev \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du projet
COPY . .

# Démarrage du serveur Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]