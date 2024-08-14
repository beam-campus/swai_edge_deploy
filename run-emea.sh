#! /bin/sh

docker compose -f watchtower.yml \
               -f swai_aco_emea.yml down


docker compose -f watchtower.yml \
               -f swai_aco_emea.yml up --build
