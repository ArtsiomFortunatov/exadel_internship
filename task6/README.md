<!-- ABOUT THE PROJECT -->
## Task6
### Subtask 1. Контейнер с PostgreSQL:

```sh
docker run --name mypostgres -e POSTGRES_PASSWORD=******* -d postgres
```
### Subtask 2. Создание таблиц, наполнение базы:
```sh
su - postgres
createdb EXADEL
```