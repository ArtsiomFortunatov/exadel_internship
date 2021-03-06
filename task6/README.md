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

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/createDB.png)

```sh
CREATE TABLE Students (ID serial , Student VARCHAR (20) UNIQUE NOT NULL, StudentID serial UNIQUE NOT NULL);

CREATE TABLE Result  (ID serial , StudentID INTEGER  UNIQUE NOT NULL, TASK1 VARCHAR(10) NOT NULL, TASK2 VARCHAR(10) NONULL, TASK4 VARCHAR(10) NOT NULL, FOREGIN KEY (StudentID) REFERENCES Students (StudentID));
```

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/TableStudents.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/TableResult.png)

### Subtask 3. Поиск по связанным таблицам:
 * Таблицы связываем по внеишим ключам столбцов studentid
 * Код запроса:

```sh
SELECT x.student, y.task1, y.task2, y.task3, y.task4
FROM students AS x
INNER JOIN result AS y ON (x.studentid = y.studentid)
WHERE x.student = 'Артём Фортунатов';
```

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask3.png)

 
### Subtask 4. Backup:

 * Команда для резервной копии:

```sh
pg_dump EXADEL > EXADELBACKUP
```
 * Удаляем БД:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask41.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask42.png)

* Команды для восстановления:

```sh  
createdb EXADEL_RESTORE
psql EXADEL_RESTORE < EXADELBACKUP
```
* Проверка:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask43.png)

### Subtask 5. Ansible role:

* Создадим дереов папок для роли:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask5.png)

* Сконфигурируем ansible.cfg, укзав путь к нашей роли:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask52.png)

* Содержимое vars/main.yaml

```sh
---
mysql_root_password: *******
mysql_password: *******
mysql_user: *******
```

* Содержимое tasks/main.yaml

```sh
---
    - name: insatll Python3
      yum:
        name: python36
        state: latest
      vars:
          ansible_python_interpreter: /bin/python2.7
    - name: insatll Modyle
      pip:
        name: "docker<5"
        executable: pip3.6
    - name: Insatll container mysql
      docker_container:
        name: mysql
        image: mysql
        ports: ['3306:3306']
        hostname: mysql
        env:
          MYSQL_ROOT_PASSWORD: "{{ mysql_root_password }}"
          MYSQL_USER: "{{ mysql_user }}"
          MYSQL_PASSWORD: "{{ mysql_password }}"
          MYSQL_DATABASE: TESTDB
      vars:
          ansible_python_interpreter: /bin/python3.6
```


* Плейбук для запуска роли:

```---
- hosts: all
  become: true
  roles:
   - sql
```
* Плейбук отработал:
![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask55.png)

* Проверка. Контейнер создался, перейдем в контейнер и подключимся к созадной базе с заданными кредами:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask54.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task6/image/subtask53.png)

