<!-- ABOUT THE PROJECT -->
## Task4
### Subtask 1. Устанвока ansible:
* Базовой ОС выбрана Amazon Linux
```sh
 sudo amazon-linux-extras install ansible2
 
 ansible --version
   ```
* Результат:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/ansible_install.png)

### Subtask 2. Модуль ping:
```sh
ansible all -i /home/ec2-user/hosts -m ping
```
* Результат

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/check_ping.png)

### Subtask 3. Install Docker:
* Код плейбука:

```sh
---

- hosts: all
  become: true

  tasks:
    - name: insatll DOCKER
      yum:
        name: docker
        state: latest
    - name: start DOCKER
      service:
        name: docker
        state: started
```

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/installdocker1.png)


* Результат на управляемых узлах:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/installdocker2.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/insatlldocker3.png)


### Extra tasks 1/2 (Deploy LAMP stack):
* Код плейбука (с изменение дефолтных кред):

```sh
---

- hosts: all
  become: true
  vars_files:
   - vars/vars.yaml

  tasks:

    - name: insatll Python3
      yum:
        name: python37
        state: latest
      vars:
          ansible_python_interpreter: /bin/python2.7
    - name: insatll Modyle
      pip:
        name: "docker<5"
        executable: pip3.7
    - name: Insatll container httpd
      docker_container:
        name: apache
        image: httpd
        ports: ['8080:80']
      vars:
          ansible_python_interpreter: /bin/python3.7
    - name: Insatll container mysql
      docker_container:
        name: mysql
        image: mysql
        ports: ['3306:3306']
        hostname: mysql
        env:
          MYSQL_ROOT_PASSWORD: "{{ mysql_root_password }}"
          MYSQL_USER: artsiom
          MYSQL_PASSWORD: "{{ mysql_password }}"
          MYSQL_DATABASE: TESTDB
      vars:
          ansible_python_interpreter: /bin/python3.7
    - name: Insatll container phpmyadmin
      docker_container:
        name: phpmyadmin
        image: phpmyadmin
        ports: ['8090:80']
        env:
          PMA_HOST: "{{ pma_host }}"
          PMA_USER: root
          PMA_PASSWORD: "{{ pma_password }}"
      vars:
          ansible_python_interpreter: /bin/python3.7         

```
* Содержимое файла vars.yaml:

```sh
---
mysql_root_password: 123a456B
mysql_password: 123a456B
pma_host: 172.17.0.3
pma_password: 123a456B 
   ```


* Результат

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/extratask1.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/extratask11.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/extratask1-21.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task4/image/extratask1-2.png)







