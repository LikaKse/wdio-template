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

# Запуск через docker-compose

**Внимание!** При наличии папки node_modules в каталоге с проектом кеш модулей использован не будет! Тесты будут запущены с пакетами установленными в этот каталог. Рекомендуется удалить node_modules если папка была создана ранее.

После выполнения тестов будет запущен allure report, который будет доступен по адресу [http://127.0.0.1:8888](http://127.0.0.1:8888)

Завершить работу с тестами можно нажав один раз **Ctrl+C** в терминале с docker-compose.

Команда запуска тестов:
```bash
docker-compose up --abort-on-container-exit
```

Запустить отдельный тест можно, указав в переменный окружения _TEST_SPEC_ имя файла с тестами. Командой ниже будут запущены тесты описанные в
_./src/tests/actions.spec.js_
```bash
TEST_SPEC=actions ocker-compose up --abort-on-container-exit
```


Команда очищающая старые контейнеры:
```bash
docker-compose rm -af
```
