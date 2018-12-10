#!/bin/bash
#Author: Jamie Biddulph (https://github.com/JamieBiddulph)
#Repository: https://github.com/JamieBiddulph/docker_scripts

dport=$((8081+ RANDOM %9091))
echo "Enter container name: "
read cname
echo "Enter image name: "
read iname

docker run -dit -p $dport:80 --name $cname -v /path/to/your/local/files:/var/opt/files:ro $iname

docker exec -d $cname /etc/init.d/mysql start

docker exec -d $cname /etc/init.d/apache2 start

docker exec -d $cname /var/opt/updatemdlconf.sh

cip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $cname)

echo "Your docker URL is: $cip"
