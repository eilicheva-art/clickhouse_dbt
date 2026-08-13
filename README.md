# dbt + ClickHouse: медальонная архитектура

Проект реализован на базе dbt и ClickHouse и использует модель обработки данных Raw → Bronze → Silver → Gold.

## Описание

Данные для проекта взяты из репозитория Hugging Face: https://huggingface.co/datasets/maksimsad/ecommerce_dbt_course/tree/main

- Raw: исходные данные без бизнес-логики;
- Bronze: базовая очистка, приведение типов и стандартизация полей;
- Silver: обогащение, дедупликация и подготовка сущностей;
- Gold: аналитические витрины и агрегированные метрики.

## Роль dbt

dbt управляет трансформациями между слоями:

- `source()` — чтение исходных таблиц;
- `ref()` — связь между моделями;
- `config()` — параметры моделей и таблиц;
- `seeds` — статические справочники;
- `tests` — проверки качества данных;
- `macros` — переиспользуемый SQL/Jinja-код.

## Используемая инфраструктура

В проекте используется Docker Desktop для локального запуска контейнера ClickHouse.


### Контейнер ClickHouse

```bash
docker run -d \
  --name dbtfromzero \
  -p 18123:8123 \
  -v dbtfromzero_data:/var/lib/clickhouse \
  -e CLICKHOUSE_USER=user \
  -e CLICKHOUSE_PASSWORD=password \
  -e TZ=UTC \
  clickhouse/clickhouse-server:25.8
```

Параметры:

- `-p 18123:8123` — доступ к ClickHouse по адресу `localhost:18123`;
- `-v dbtfromzero_data:/var/lib/clickhouse` — сохранение данных между перезапусками;
- `CLICKHOUSE_USER=user` и `CLICKHOUSE_PASSWORD=password` — учетные данные для подключения;
- `clickhouse/clickhouse-server:25.8` — используемый образ ClickHouse.

## Подготовка окружения

### 1. Установка VS Code

Установить расширение `Power User for dbt`.

### 2. Создание виртуального окружения

```bash
python -m venv venv
```

Активация:

```bash
# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate
```

### 3. Установка dbt-clickhouse

```bash
pip install dbt-clickhouse
```

### 4. Инициализация проекта

```bash
dbt init clickhouse_project
```

## Конфигурация подключения

`profiles.yml`:

```yaml
clickhouse_project:
  target: dev
  outputs:
    dev:
      type: clickhouse
      schema: default
      host: localhost
      port: 18123
      user: user
      password: password
      secure: false
```

`dbt_project.yml`:

```yaml
profile: 'clickhouse_project'
```

## Проверка подключения

```bash
cd clickhouse_project
dbt debug
```

Ожидаемый результат:

```text
Connection test: [OK connection ok]
All checks passed!
```

## Основные команды

```bash
# Проверка подключения
dbt debug

# Запуск моделей
dbt run

# Запуск тестов
dbt test

# Генерация документации
dbt docs generate

# Просмотр документации
dbt docs serve
```

## Итог

Проект формирует аналитическое хранилище на базе dbt и ClickHouse, где данные последовательно проходят этапы очистки, объединения и агрегации, обеспечивая подготовку данных для BI, аналитики и отчетности.

## Используемые источники

[Документация dbt на русском](https://docs.getdbt.tech)

[Документация Docker](https://docs.docker.com)

Книги
- "Основы инженерии данных", Дж. Рис, М. Хоусли
- "Архитектура медальона", С. Питхейн

Курсы на Stepic
- dbt с нуля
- dbt с нуля — Построение хранилища данных (DWH) на ClickHouse
