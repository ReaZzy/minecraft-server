#!/bin/sh
read -p 'Назва збереження: ' saveName
saveName=${saveName:-server_save}
git pull origin master && \
git add . && \
git commit -am "feat: $saveName" && \
git push origin master && \
exit
