#! /bin/sh

docker compose -f watchtower.yml \
               -f swai_aco_asia.yml down


docker compose -f watchtower.yml \
               -f swai_aco_asia.yml up --build
