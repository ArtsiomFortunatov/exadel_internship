<!-- ABOUT THE PROJECT -->
## Task5
### Subtask 1. Устанвока Jenkins:

* Установка в docker контейнер:

```sh
 docker pull jenkins/jenkins
 docker container run --name jenkins-mymaster -d --publish 8060:8080 jenkins/jenkins
   ```
### Subtask 2. Устанвока базовых плагинов Jenkins:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/jenkinsplugins.png)


### Subtask 3. Create build agents:

* Необходимо создать ключ и настроить УЗ Jenkins по SSH.
* Затем при создании контейнеров для агентов необходимо передать публиный ключ
* В результате созданы 2 агента:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/agent1_%20online.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/agent1_online.png)

* Агенты онлайн:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/agents.png)

### Subtask 4. Create first job:

* Job выполнялась по лейбу на одном агенте (agent):

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/First%20job.png)





