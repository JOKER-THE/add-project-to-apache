### Развертывание локального сервера LAMP

1. Устанавливаем пакетный менеджер Tasksel:
```
sudo apt install tasksel
```

2. Устанавливаем LAMP-сервер:
```
sudo tasksel install lamp-server
```

3. Создаем пароль для Root базы данных MySQL:
```
sudo mysql -u root -p
# вводим пароль
exit
```

4. Создаем пользователя для Phpmyadmin:
```
sudo mysql -u root -p 
CREATE USER 'ИМЯ ПОЛЬЗОВАТЕЛЯ'@'localhost' IDENTIFIED BY 'ПАРОЛЬ';
GRANT ALL PRIVILEGES ON * . * TO 'ИМЯ ПОЛЬЗОВАТЕЛЯ'@'localhost';
FLUSH PRIVILEGES;
```

5. Запускаем скрипт командой в терминале для добавления локального сайта:
```
sudo ./add-project.sh
```