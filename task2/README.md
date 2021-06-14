<!-- ABOUT THE PROJECT -->
## About The Task2
### Цель проекта:
* Сделать веб страницу с текстом “Hello World” и информацией о текущей версией операционной системы
* Автоматизировать процессы развертывания 
### Ссылка на  веб страницу без использования скрипта:
http://ec2-3-66-218-195.eu-central-1.compute.amazonaws.com
### SSH без использования пароля бежду 2 инстансами AWS:
* Выполняетс на стороне узла с которого будет подключение 
```sh
   ssh-keygen -t rsa -N "" -f /home/ec2-user/.ssh/id_rsa
   cat ~/.ssh/id_rsa.pub | ssh -i ~/.ssh/my.key ec2-user@myip "cat >> ~/.ssh/authorized_keys"
   
     * mykey - AWS ключ для возможности подключения до обмена public key  между нодами.
   ```
### Скрипт для автоматической устанвоки и настройки httpd:
```sh
#!/bin/bash
sudo yum install httpd -y
sudo service httpd start
sudo cd /var/www/html
sudo chown ec2-user:ec2-user /var/www/html/index.html
sudo echo -n > /var/www/html/index.html
sudo cat << EOF >> /var/www/html/index.html
<!DOCTYPE html>
<html>
<body>
<h1>HELLO WORLD</h1>
EOF

VERSION=$(cat /etc/*release| grep NAME| head -1)
SMALVERSION=${VERSION#*NAME=}

sudo echo '<h2>' >> /var/www/html/index.html
sudo echo "$SMALVERSION" >> /var/www/html/index.html
sudo echo '</h2>' >> /var/www/html/index.html

sudo cat << EOF >> /var/www/html/index.html
<p>by Artsiom Fortunatov</p>
</body>
</html>
EOF

   * Переменная VERSION получает информацию о ОС из файла /etc/*release
   * Переменная SMALVERSIONVERSION получает информацию обрезанную по определенному полю
   ```
### Добавления скрипта к выполнению, во время разворачивания нового инстанса:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task2/AddUserData.png)