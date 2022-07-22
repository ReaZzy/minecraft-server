#!/bin/sh
function closeServer () {
  git add . && \
  git commit -am "feat: 123"
  git push origin master
}

git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
trap closeServer INT SIGTERM SIGINT exit
