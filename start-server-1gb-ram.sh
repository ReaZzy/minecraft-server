#!/bin/sh
git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
trap "git add . && git commit -am \"feat: h\" && git push origin master" INT
sleep 10
