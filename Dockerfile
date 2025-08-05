# Gunakan PHP + Apache
FROM php:8.2-apache

# Install ekstensi yang diperlukan (jika pakai database)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install Python3 dan pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy semua file website ke folder web server
COPY . /var/www/html/

# Install dependencies Python
RUN pip3 install --no-cache-dir -r /var/www/html/requirements.txt || true

# Expose port 80 untuk Render
EXPOSE 80
