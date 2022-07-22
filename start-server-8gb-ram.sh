#!/bin/sh

read -p "Назва збереження: " saveName

function closeServer () {
  saveName=${saveName:-server_save}
  git pull origin master
  git add .
  git commit -am "feat: $saveName"
  git push origin master
  printf "\e[1;42m ГОТОВО \e[0m"
}

printf "\e[1;32m НАЖМИ CTRL+C і жди аби вийти \e[0m"
git pull origin master && \
java -Xmx8192M -Xms8192M -jar server.jar nogui

trap closeServer INT SIGTERM SIGINT exit
