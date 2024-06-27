#! /bin/sh

docker compose -f watchtower.yml \
               -f org-agents-2.yml down


docker compose -f watchtower.yml \
               -f org-agents-2.yml up --build
