#!/bin/bash
#Author: Jamie Biddulph (https://github.com/JamieBiddulph)
#Repository: https://github.com/JamieBiddulph/docker_scripts

echo "Enter container name: "
read cname

docker start $cname

docker exec -d $cname /etc/init.d/mysql start

docker exec -d $cname /etc/init.d/apache2 start

docker exec -d $cname /var/opt/updatemdlconf.sh

cip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $cname)

echo "Your docker URL is: $cip"
