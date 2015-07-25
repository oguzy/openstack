murano-api: tox -e venv -- murano-api --config-file ./etc/murano/murano.conf
murano-engine: tox -e venv -- murano-engine --config-file ./etc/murano/murano.conf
murano-dashboard: tox -e venv -- python manage.py syncdb && tox -e venv -- python manage.py runserver 192.168.56.100:8080


after resetting:

sudo apt-get install python-pip python-dev libmysqlclient-dev libpq-dev \
libxml2-dev libxslt1-dev libffi-dev
sudo pip install tox -U


mysql -u root -p
mysql> CREATE DATABASE murano;
mysql> GRANT ALL PRIVILEGES ON murano.* TO 'murano'@'localhost' \
    IDENTIFIED BY 'MURANO_DBPASS';
mysql> exit;

at the murano/murano directoy

tox -e venv -- murano-db-manage --config-file ./etc/murano/murano.conf upgrade

then run api service

at the murano/murano directory

tox -e venv -- murano-manage --config-file ./etc/murano/murano.conf import-package ./meta/io.murano


run engine

run the horizon

import apps

tox -e venv -- murano-manage --config-file ./etc/murano/murano.conf import-package /home/oguz/murano/murano-apps/io.murano.apps.apache.ApacheHttpServer

dont forget to run iptables.sh
check the name of the image before uploading
upload both docker and kubernetes apps to run a hostonly docker app
