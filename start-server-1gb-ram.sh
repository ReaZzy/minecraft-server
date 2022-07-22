#!/bin/sh
function closeServer () {
  set -e
  read -p 'Назва збереження: ' saveName
  saveName=${saveName:-server_save}
  git pull origin master && \
  git add . && \
  git commit -am "feat: $saveName" && \
  git push origin master

}

git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
trap closeServer INT SIGTERM SIGINT exit
