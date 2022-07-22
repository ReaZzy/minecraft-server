#!/bin/sh

read -p $(printf "\e[1;33m Назва збереження: \e[0m") saveName

function closeServer () {
  saveName=${saveName:-server_save}
  git pull origin master
  git add .
  git commit -am "feat: $saveName"
  git push origin master
  printf "\e[1;42m ГОТОВО \e[0m"
}

git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
trap closeServer INT SIGTERM SIGINT exit
