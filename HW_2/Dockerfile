# Используем базовый образ для Python 3.9
FROM python:3.9

# Устанавливаем имя и контактную информацию мейнтейнера
MAINTAINER DeeUshakoff <Dee.Ushakoff@gmail.com>

# Устанавливаем переменные окружения
ENV DEBIAN_FRONTEND=noninteractive

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y \
    nginx \
    postgresql postgresql-contrib \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Удаляем дефолтную конфигурацию Nginx
RUN rm /etc/nginx/sites-enabled/default

# Копируем локальные файлы в контейнер
COPY . /app

# Настройка прав доступа к директории
RUN chown -R www-data:www-data /app && chmod -R 755 /app

# Настройка Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Создаем точку монтирования для данных PostgreSQL
VOLUME ["/var/lib/postgresql/data"]

# Открываем порты для Nginx и PostgreSQL
EXPOSE 80 5432

# Указываем команду по умолчанию для запуска Nginx и PostgreSQL
CMD service postgresql start && nginx -g 'daemon off;'
