#! /bin/sh

nordvpn connect "$1"

docker compose -f watchtower.yml \
               -f org-agents-1.yml down


docker compose -f watchtower.yml \
               -f org-agents-1.yml up --build
