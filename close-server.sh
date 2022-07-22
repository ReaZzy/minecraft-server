#!/bin/sh
set -e
read -p 'Назва збереження: ' saveName
saveName=${saveName:-server_save}
git pull origin master && \
git add . && \
git commit -am "feat: $saveName"
sleep 20
git push -u origin master
