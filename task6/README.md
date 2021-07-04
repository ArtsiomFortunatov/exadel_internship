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

```sh
CREATE TABLE Students (ID serial , Student VARCHAR (20) UNIQUE NOT NULL, StudentID serial UNIQUE NOT NULL);

CREATE TABLE Result  (ID serial , StudentID INTEGER  UNIQUE NOT NULL, TASK1 VARCHAR(10) NOT NULL, TASK2 VARCHAR(10) NONULL, TASK4 VARCHAR(10) NOT NULL, FOREGIN KEY (StudentID) REFERENCES Students (StudentID));
```

### Subtask 3. Поиск по связанным таблицам:
 * Таблицы связываем по внеишим ключам столбцов studentid
 * Код запроса:

```sh
SELECT x.student, y.task1, y.task2, y.task3, y.task4
FROM students AS x
INNER JOIN result AS y ON (x.studentid = y.studentid)
WHERE x.student = 'Артём Фортунатов';
```