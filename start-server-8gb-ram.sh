#!/bin/sh
git pull origin master && \
java -Xmx8192M -Xms8192M -jar server.jar nogui
