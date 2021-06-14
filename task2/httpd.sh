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

