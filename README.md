# Django Docker Boilerplate 🚀

**Современный шаблон для быстрого старта Django-проектов с Docker, PostgreSQL**

## 📌 Особенности

- 🐳 Готовые конфиги Docker и Docker Compose
- 🐘 PostgreSQL с оптимизированными настройками
- 🔧 Автоматическая настройка через Makefile
- ⚙️ Раздельные настройки для dev/prod сред
- 📝 Подробная документация

## 🛠 Технологический стек

| Компонент        | Технология       |
| ---------------- | ---------------- |
| Backend          | Django 4.2+      |
| Database         | PostgreSQL 14+   |
| Containerization | Docker + Compose |

## 🚀 Быстрый старт

### Требования

- Docker 20.10+
- Docker Compose 2.0+
- Python 3.10+ (опционально)

### Установка

```bash
# 1. Клонировать репозиторий
git clone https://github.com/GenyaElamko/django-docker-boilerplate.git
cd django-docker-boilerplate

# 2. Создать .env файл
cp .env.example .env

# 3. Запустить проект
make app
```

## 🏗 Структура проекта

```
.
├── core/                         # Основное приложение
│   ├── apps/                     # Приложение
│   ├─────── products/
│   └── project/                  # Конфиг для Django
│   ├─────── settings/
├── docker_compose/               # Конфиги Docker Compose
│   ├── app.yaml                  # Для приложения
│   └── storages.yaml             # Для хранилища
├── static/                       # Статические файлы
├── .env.example                  # Шаблон переменных окружения
├── Dockerfile                    # Конфик для Docker
├── Makefile                      # Для управления приложением
├── README.md                     # Документация
└── requirements.txt              # Зависимости

```

## 🎛 Управление проектом через Makefile

```bash
# Запуск приложения и  базы данных
make app

# Отслеживание журналов в контейнере приложения
make app-logs

# Остановка приложения и базы данных
make app-down

# Запуск только хранилища. Для отладки, разработки приложения следуюет запускать локально
make storages

# Отслеживания журналов хранилища
make storages-logs

# Остановка хранилища
make storages-down

# Создание миграции в модели
make migrations

# Применения всех созданных миграций
make migrate

# Сбор статических данных
make collectstatic

# Создания пользователя с правами администратора
make superuser
```

## 🌐 Доступные сервисы

| Сервис | URL (dev)        | Порт |
| ------ | ---------------- | ---- |
| Django | http://localhost | 8000 |

## 🔒 Переменные окружения

Создайте `.env` файл на основе `.env.example`:

```ini
# Django
DJANGO_SECRET_KEY=secrettoken
DJANGO_PORT=8000

# Database
POSTGRES_DB=postgres
POSTGRES_USER=my_user
POSTGRES_PASSWORD=my_password
POSTGRES_HOST=postgres
POSTGRES_PORT=5432
```
