#!/bin/sh
printf "\n\n\e[1;32m КОЛИ ЗАКІНЧИТЕ ГРАТИ НАЖМИ CTRL+C І ЖДИ ПОКИ НЕ НАПИШЕ ГОТОВО\e[0m\n\n"
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

trap closeServer SIGINT

git pull origin master && \
java -Xmx${ram}M -Xms${ram}M -jar server.jar nogui


