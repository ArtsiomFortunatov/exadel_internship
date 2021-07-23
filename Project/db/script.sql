CREATE USER 'redmine'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'localhost';