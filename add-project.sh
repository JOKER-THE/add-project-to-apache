#!/bin/bash
echo -e "Введите название проекта (Например example.com)";
read NAME_OF_PROJECT

echo -e "Введите публичный каталог проекта (подпапка с index.php)";
read NAME_OF_PUBLIC

# Создаем каталог проекта и публичный подкаталог,
# в котором будет храниться index-файл проекта.
sudo mkdir /home/joker-the/www/$NAME_OF_PROJECT
sudo mkdir /home/joker-the/www/$NAME_OF_PROJECT/$NAME_OF_PUBLIC

# Добавляем правила в конфигурационный файл Apache
add_to_apache_conf="
<VirtualHost *:80>
	ServerName ${NAME_OF_PROJECT}
	ServerAdmin webmaster@localhost
	DocumentRoot /home/joker-the/www/${NAME_OF_PROJECT}/$NAME_OF_PUBLIC
	<Directory /home/joker-the/www/${NAME_OF_PROJECT}/$NAME_OF_PUBLIC>
	Options Indexes FollowSymLinks ExecCGI Includes
	AllowOverride All
	Require all granted
	</Directory>
	ErrorLog /error.log
	CustomLog /access.log combined
</VirtualHost>"

# Добавляем новый хост
touch /etc/apache2/sites-available/${NAME_OF_PROJECT}.conf
echo "$add_to_apache_conf" >> /etc/apache2/sites-available/${NAME_OF_PROJECT}.conf
echo "127.0.0.1 ${NAME_OF_PROJECT}" >> /etc/hosts

# Запускаем конфигурацию сайта
sudo a2ensite ${NAME_OF_PROJECT}

# Перезапускаем апач
sudo systemctl restart apache2

echo "Finished"