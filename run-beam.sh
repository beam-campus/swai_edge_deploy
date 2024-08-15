#! /bin/sh

# nordvpn connect "$1"

docker compose -f watchtower.yml \
               -f "$1" down  


docker compose -f watchtower.yml \
               -f "$1"  up --build "$2" 


nohup ./start-play.sh &