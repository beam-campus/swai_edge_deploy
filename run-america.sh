#! /bin/sh

docker compose -f watchtower.yml \
               -f swai_aco_america.yml down


docker compose -f watchtower.yml \
               -f swai_aco_america.yml up --build
