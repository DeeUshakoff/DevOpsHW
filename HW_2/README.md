# Инструкции по запуску

1. Клонируйте репозиторий
2. Перейдите в директорию проекта:
    `cd your-repository`
3. Соберите Docker-образ:
    `docker build -t my_web_server .`
4. Запустите контейнер:
    `docker run -d -p 8080:80 --name my_web_container my_web_server`
5. Проверьте веб-сервер:
http://localhost:8080