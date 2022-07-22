#!/bin/sh

read -p "Скільки мегабайт оперативи (від 1024): " ram
read -p "Назва збереження: " saveName
ram=${ram:-1024}
saveName=${saveName:-server_save}

function closeServer () {
  git pull origin master
  git add .
  git commit -am "feat: $saveName"
  git push origin master
  printf "\e[1;42m ГОТОВО \e[0m"
}

printf "\e[1;32m НАЖМИ CTRL+C і жди аби вийти \e[0m"
git pull origin master && \
java -Xmx${ram}M -Xms${ram}M -jar server.jar nogui

trap closeServer INT SIGTERM SIGINT exit
