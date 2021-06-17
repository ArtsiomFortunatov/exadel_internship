<!-- ABOUT THE PROJECT -->
## Task3
### Subtask 1. Устанвока docker:
* Базовой ОС выбрана CentOS
```sh
   yum install docker          *Установка из стандартных репозиториев 
   docker --version            *Проверка версии
   systemctl start docker      *Запуск 
   systemctl enable  docker    *Автозапуск после рестарта
   systemctl status  docker    *Проверка статуса
   ```
### Extratask 1.1 Устанвока docker чеерз скрипт:
* Скипт **autoinstall.sh** на основе команд из официальной документации,в том числе с проверкой и удалением старых версий:
```sh
#!/bin/bash
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine\
                  docker-ce\
                  docker-ce-cli
sudo yum install -y yum-utils 
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io 
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world
   ```
### Subtask 2.1 Проверка работоспособности (Hello-World)
```sh
   docker run hello-world
   ```
* Вывод команды:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task3/image/HelloWorld.png)

### Extratask 2. Html page:
* Создан простой Html файл **index.html**, проброшен в контейнер httpd:
```sh
   docker container  run -d -p 80:80 --name httpd -v /opt/exadel/forhttpd/index.html:/usr/local/apache2/htdocs/index.html httpd
   ```
* Результат:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task3/image/ChangeHtml.png)

### Subtasks 3.1/3.2 + Extratasks 3.1.1/3.2.1 . Dockerfile

```sh
  FROM centos:7

RUN yum -y install httpd 
WORKDIR /var/www/html
COPY ./forhttpd/index.html .
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
ARG NAME=ArtsiomFortunatov
ENV DEVOPS=$NAME
RUN  echo $DEVOPS >> index.html
   ```
* Результат:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task3/image/Dockerfile.png)

### Subtask 4.1
* Образ загружен на DockerHub получить можно командой:

```sh
   docker pull 2757429/exadel
   ```
### Subtask 5

* Docker-compose:
```sh
   version: '2'
services:
  web:
    image: 2757429/exadel
    ports:
      - "8075-8085:80"
  java:
    container_name: myjava
    image: milkyway/java-hello-world
    ports:
      - "8090:80"
    depends_on:
      - "db"
  db:
    container_name: mydb
    image: mongo
    ports:
      - "27019:27019"
   ```

* Запуск compose + scale:
```sh
   docker-compose up --scale web=5 -d
   ```
* Результат:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task3/image/scale.png)