#!/bin/sh
git pull origin master && \
java -Xmx4096M -Xms4096M -jar server.jar nogui
