# Usa una imagen base más ligera
FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia solo el archivo de dependencias para instalar primero
COPY requirements.txt /app/

# Instala dependencias del sistema y paquetes de Python
RUN apt-get update && apt-get install -y default-libmysqlclient-dev gcc \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

# Copia el resto de la aplicación al contenedor
COPY . /app

# Expone el puerto de Flask
EXPOSE 5000

# Comando de ejecución
CMD ["python", "app.py"]
