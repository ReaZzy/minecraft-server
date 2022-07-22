#!/bin/sh
git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
