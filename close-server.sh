#!/bin/sh
set -e
read -p 'Назва збереження: ' saveName
saveName=${saveName:-server_save}
git pull origin master && \
git add . && \
git commit -a -am "feat: $saveName" && git push -u origin master
