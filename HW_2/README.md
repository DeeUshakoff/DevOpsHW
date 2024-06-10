# Инструкции по запуску

1. Клонируйте репозиторий
2. Перейдите в директорию проекта:
    `cd <your_repository_path>`
3. Соберите Docker-образ:
    `docker build -t <image_name> .`
4. Запустите контейнер:
    `docker run -d -p 8080:80 --name <container_name> <image_name>`
5. Проверьте веб-сервер:
http://localhost:8080