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

### Subtask 1.2 - 1.7:

* Устанвока агентов:

```sh
rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-2.el7.noarch.rpm
yum install zabbix zabbix-agent
iptables -A INPUT -p tcp -s 192.168.99.148 --dport 10050 -m state --state NEW,ESTABLISHED -j ACCEPT. // 192.168.99.148 -адрес zabbix сервера

```
* Дашборты +  passive check 

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/Dashboard1.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/Dashboard2.png)

**Active check. Принципиальное отличие в настройке это верное конфигурирование hostname и ServerActive на стороне агента**

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/active%20agent1.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/active%20agent3.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/active%20agent.png)

**ICMP check**

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/icmp.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/icmp2.png)

**Maintenance**

* Алерты видны:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/maintense.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/maintense3.png)

* После включения Maintenance :

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/maintense1.png)

* All dashboard

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/allDashboard.png)

### Subtask 2 ELK

*  Устанвоку производил на ВМ, индексы

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/elk1.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/elk2.png)


![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/patern.png)

* Простые Dashboards:

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/elk3.png) 

* Конфигурация logstash.conf с использыванием gelf:

```sh

input {
  beats {
    port => 5044
  }
 gelf {
        port => 12201
        type => gelf
   }
}
 
output {
  if{
  elasticsearch {
    hosts => "elasticsearch:9200"
    manage_template => false
    index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
    document_type => "%{[@metadata][type]}"
  }
  }
   else if [type] == "gelf" {
      elasticsearch {
      hosts => "elasticsearch:9200"
      index => "gelf-%{+YYYY.MM.dd}"
      }
    }
    else [type] == "centos" {
      elasticsearch {
      hosts => "elasticsearch:9200"
      index => "centos-%{+YYYY.MM.dd}"
      }
    }
}
```

### Subtask 3 Grafana

* Графана установлена на ту же ВМ (поэтому при подключении к ELK укзано localhost, выбран стандартынй идекс с timestamp меткой)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/grafana1.png)

![](https://github.com/ArtsiomFortunatov/exadel_internship/blob/master/task7/image/grafana2.png)