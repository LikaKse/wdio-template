## Описание 
Шаблон автотестов на webdriverio для дебага ошибки в wdio-video-reporter


## Запуск тестов в Docker контейнере локально

собираем контейнер по описанию из Dockerfile и именем videoerror
```bash
docker build -t videoerror .
```

запускаем контейнер командой и монтируем туда текущий каталог
```bash
docker run -ti -v $(pwd):/e2e --entrypoint=/bin/bash --rm videoerror
```

в контейнере 1 раз выполняем
```bash
yarn install
```

и окружение готово к запуску тестов. Нужно следить чтобы версия хрома была такой же как и версия chromedriver в файле package.json
```bash
google-chrome --version
```

просмотреть отчет allure, запускать лучше не в контейнере
```bash
npx allure open
```

запуск тестов
```bash
npx wdio run wdio.conf.js
```

очистка результатов прохождения тестов
```bash
rm -rf allure-re* output/* 
```
