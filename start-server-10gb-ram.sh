#!/bin/sh
git pull origin master && \
java -Xmx10000M -Xms10000M -jar server.jar nogui
