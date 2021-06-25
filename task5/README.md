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


### Subtask 5. Docker ps:

* Добавляем docker хост как агент (dockerhost) :

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/addDockerHost_agent.png)

* Создаем pipeline:

```sh
pipeline {
    agent { label 'dockerhost'}

    stages {
        stage('DockerHOST') {
            steps {
                sh '''
                  echo $HOSTNAME
                  docker ps -a
                '''  
            }
        }
    }
}
```

* Результат:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/resultask5.png)

* Сравнение с хостом:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/resultask52.png)



### Subtask 6. Dockerfile in Jenkins:

* Используем модуль git в Jenkins
* Pipeline:

```sh
pipeline {
    agent { label 'dockerhost'}
    stages {
        stage('DockerFILE') {
            steps {
                git url: 'https://github.com/ArtsiomFortunatov/exadel_internship.git'
                sh '''
                  echo $HOSTNAME
                  cd task3
                  cat Dockerfile
                  mkdir -p forhttpd
                  cp index.html ./forhttpd
                  docker image build -t mydockerfile:jenkins .
                '''  
            }
        }
    }
}
```
* Результат на хосте:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/task6.png)

### Subtask 7. Шифрованная переменная:

* Для того чтобы не "светить" переменную в теле Pipeline, зададим её в Global environment:


![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task5/image/GlobaEnv.png)

* Состсавим Pipeline, предварительно установив модуль Mask Passwords который зашифрует нужную нам переменную:

pipeline {
    agent { docker { image 'httpd'} }
    stages {
        stage('Test') {
            steps {
              wrap([$class: "MaskPasswordsBuildWrapper",
                varPasswordPairs: [[password: PASSWORD1]]]) {
                 echo "Password: ${PASSWORD1}" 
                 sh '''
                 echo "Password: ${PASSWORD1}" 
                 docker  run -d -e PASSWORD=$PASSWORD1 httpd
                 '''
                                 }
            }
        }
    }
}


