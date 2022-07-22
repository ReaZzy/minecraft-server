#!/bin/sh
set -e
read -p 'Назва збереження: ' saveName
saveName=${saveName:-server_save}
git pull origin master && \
git add . && \
git commit -am "feat: $saveName"
sleep 20s
git push -u origin master
