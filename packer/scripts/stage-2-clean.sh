#!/bin/bash

echo " - start stage-2 -"

# Обновление и очистка всех ненужных пакетов
sudo yum update -y
sudo yum clean all

# Добавление ssh-ключа для пользователя vagrant
#sudo mkdir -pm 700 /home/vagrant/.ssh
#sudo curl -sL https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
#sudo chmod 0600 /home/vagrant/.ssh/authorized_keys
#sudo chown -R vagrant:vagrant /home/vagrant/.ssh

# Удаление временных файлов
echo "- delete tmp -"

sudo rm -rf /tmp/*
sudo rm  -f /var/log/wtmp /var/log/btmp
sudo rm -rf /var/cache/* /usr/share/doc/*
sudo rm -rf /var/cache/yum
sudo rm -rf /vagrant/home/*.iso
sudo rm  -f ~/.bash_history

history -c

#sudo rm -rf /run/log/journal/*

sudo sync
sudo grub2-set-default 0

#echo "###   Hi from second stage" >> /boot/grub2/grub.cfg

echo " - ok stage-2 -"
