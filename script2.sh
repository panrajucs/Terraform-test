#!/bin/bash
sudo usermod -a -G docker jenkins
usermod -aG root jenkins
chmod 664 /var/run/docker.sock
chmod 777 /var/run/docker.sock
sudo service jenkins restart
sleep '10s'
docker -H tcp://10.1.1.200:2375 run --rm -dit --name jenkins2 --hostname jenkins2 -p 8000:80 sreeharshav/rollingupdate:v5
