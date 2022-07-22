#!/bin/sh
function closeServer () {
  read -p 'Назва збереження: ' saveName
  saveName=${saveName:-server_save}
  git pull origin master && \
  git add . && \
  git commit -am "feat: $saveName"
  git push origin master
}

git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
trap "git add . && git commit -am \"feat: $saveName\" && git push origin master" INT SIGTERM SIGINT exit
