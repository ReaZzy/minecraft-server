#!/bin/sh

GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

function closeServer () {
  read -p '\n\n${BOLDGREEN}Назва збереження:${ENDCOLOR} ' saveName
  saveName=${saveName:-server_save}
  git pull origin master && \
  git add . && \
  git commit -am "feat: $saveName" && \
  git push origin master
}

git pull origin master && \
java -Xmx1024M -Xms1024M -jar server.jar nogui
trap closeServer INT SIGTERM SIGINT exit
