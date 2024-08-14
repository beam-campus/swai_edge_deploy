#! /bin/sh

# nordvpn connect "$1"

docker compose -f watchtower.yml \
               -f swai_aco_africa.yml down


docker compose -f watchtower.yml \
               -f swai_aco_africa.yml up --build
