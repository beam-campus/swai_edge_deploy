#! /bin/sh

docker compose -f watchtower.yml \
               -f org-agents-3.yml down


docker compose -f watchtower.yml \
               -f org-agents-3.yml up --build
