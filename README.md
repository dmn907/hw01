 #### Обновление ядра и создание образа системы  
 
1) Обновить ядро ОС из репозитория ELRepo
2) Создать Vagrant box c помощью Packer
3) Загрузить Vagrant box в Vagrant Cloud

В результате работы создан vagrant box и опубликован на vagrant cloud. Результирующий vagrant файл в github:
https://github.com/dmn907/hw01/blob/main/Vagrantfile


В ходе работы собран box c версией ядра 6.1. К моменту сборки kernel_ml соответствует версии ядра 6.1:

[root@otus-c8-k6 vagrant]# uname -r
6.1.0-1.el8.elrepo.x86_64

В ходе работы внесены изменения в исходный конфигурационный  файл centos.json для сборки образа с помощью packer:
*  секция provisioners разбита на две части для упрощения отладки
*  добавлено, передача пароля для выполнения команды под sudo
 execute_command": "echo 'vagrant' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"

Внесены изменения в файл stage-2-clean.sh :
* отменены команды по копирования ssh public key , так как наличие аутентификации по ключу не позволяло завершить выключение vm в секции provisioners
 
 
