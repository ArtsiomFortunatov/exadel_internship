<!-- ABOUT THE PROJECT -->
## Task3
### Subtask 1 Устанвока docker:
* Базовой ОС выбрана CentOS
```sh
   yum install docker          *Установка из стандартных репозиториев 
   docker --version            *Проверка версии
   systemctl start docker      *Запуск 
   systemctl enable  docker    *Автозапуск после рестарта
   systemctl status  docker    *Проверка статуса
   ```
### Subtask 2 Проверка работоспособности (Hello-World)
```sh
   docker run hello-world
   ```
* Вывод команды:
