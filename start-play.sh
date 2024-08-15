#!/bin/bash

while true; do
  # Get the list of running container IDs
  containers=($(docker ps -q))

  # Check if there are any running containers
  if [ ${#containers[@]} -eq 0 ]; then
    echo "No running containers to restart."
    exit 1
  fi

  # Select a random container ID
  random_container=$(echo "${containers[@]}" | tr ' ' '\n' | shuf -n 1)

  # Get the name of the selected container
  container_name=$(docker inspect --format '{{.Name}}' "$random_container" | sed 's/^\/\|\/$//g')

  # Echo the container name before restarting
  echo "Restarting container: $container_name ($random_container)"

  sleep 5

  # Restart the selected container
  docker restart "$random_container"

  # Echo the container name after restarting
  echo "Restarted container: $container_name ($random_container)"

  # Sleep for a random time interval between 0 and 120 seconds
  sleep_time=$(shuf -i 0-120 -n 1)
  sleep "$sleep_time"
done