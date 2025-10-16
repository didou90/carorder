FROM python:3.12-slim

# Installer dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    pkg-config \
    libcairo2-dev \
    libjpeg-dev \
    libffi-dev \
    libpango1.0-dev \
    cmake \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copier les fichiers
WORKDIR /app
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du code
COPY . .

# Lancer l'application (exemple)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]