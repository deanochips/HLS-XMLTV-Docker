#!/bin/bash

touch /tmp/init-status

FIRSTSTART="FIRSTSTART_HAPPENED_ALREADY"
if [ ! -e /root/$FIRSTSTART ]; then
echo "First Start" > /tmp/init-status

touch /root/$FIRSTSTART

cd /

mkdir -p /var/www/html/xmltv
chmod 777 /var/www/html/xmltv
mkdir -p /var/www/html/streams
chmod 777 /var/www/html/streams
chown www-data:www-data /var/www/html/streams
chmod g+s /var/www/html/streams

if [ -e /HLS-XMLTV/config/config.cfg ]; then
mv /HLS-XMLTV/config/config.cfg /HLS-XMLTV/config/config.cfg.tmp
CONFIG_EXISTS="YES"
fi

# Get HLS / XMLTV Home Broadcasting
wget https://github.com/deanochips/HLS-XMLTV---Home-Broadcasting/archive/master.zip
unzip master.zip

rm -Rf /HLS-XMLTV---Home-Broadcasting-master/channels
rm -Rf /HLS-XMLTV---Home-Broadcasting-master/concat_lists

mv /HLS-XMLTV---Home-Broadcasting-master/* /HLS-XMLTV/
rm -Rf /HLS-XMLTV---Home-Broadcasting-master/
rm master.zip

sed -i '32iif [ "$1" = "CRON_USER" ]; then exit; fi' /HLS-XMLTV/config.cfg
sed -i '32i# --------------------------------------------------------------------------------------------------' /HLS-XMLTV/config.cfg
sed -i '32i# Comment Out this whole line when your ready to run the script and the cron will run                          ' /HLS-XMLTV/config.cfg
sed -i '32i# --------------------------------------------------------------------------------------------------' /HLS-XMLTV/config.cfg

chmod +x -R /HLS-XMLTV/*

mv /HLS-XMLTV/config.cfg /HLS-XMLTV/config.cfg.default
mkdir -p /HLS-XMLTV/config


sed -i -r "s/192.168.1.214/"$MY_IPS"/g" /HLS-XMLTV/config.cfg.default
mv /HLS-XMLTV/config.cfg.default /HLS-XMLTV/config/config.cfg

if [ "$CONFIG_EXISTS" = "YES" ]
then
mv /HLS-XMLTV/config/config.cfg /HLS-XMLTV/config/config.cfg.default
mv -f /HLS-XMLTV/config/config.cfg.tmp /HLS-XMLTV/config/config.cfg
fi


ln -s /HLS-XMLTV/config/config.cfg /HLS-XMLTV/config.cfg


ln -s /usr/bin/ffmpeg /bin/ffmpeg
ln -s /usr/bin/ffprobe /bin/ffprobe

crontab -l | { cat; echo "*/3       *       *       *       *       /HLS-XMLTV/cron.sh CRON_USER"; } | crontab -

touch /var/log/messages
crontab -l | { cat; echo "*/5       *       *       *       *       /usr/sbin/logrotate  /etc/logrotate.conf"; } | crontab -

else
echo "Normal Start" > /tmp/init-status
chmod 777 /var/www/html/xmltv
chown www-data:www-data /var/www/html/xmltv

chmod 777 /var/www/html/streams
chown www-data:www-data /var/www/html/streams
chmod g+s /var/www/html/streams
fi

/HLS-XMLTV/cron.sh CRON_USER &


exec "$@"
