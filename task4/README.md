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





