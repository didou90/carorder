FROM python:3.12-slim

# Installer toutes les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    pkg-config \
    cmake \
    libcairo2-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpq-dev \
    default-libmysqlclient-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir "urllib3<2" "requests<2.29"
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install crispy-bootstrap4

# Copier le reste du projet
COPY . .

# Démarrer le serveur Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]