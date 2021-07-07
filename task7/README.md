<!-- ABOUT THE PROJECT -->
## Task7
### Subtask 1.1 Устанвока Zabbix:
* Был выбран вариант установки в контейнеры через Docker-Compose из git репозитория (выбран вариант с pgsql базой):

```sh
git clone https://github.com/zabbix/zabbix-docker.git
docker-compose docker-compose_v3_centos_pgsql_latest.yaml up -d
```
* Проверяем работоспособность:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/task1.1.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/task1.2.png)
