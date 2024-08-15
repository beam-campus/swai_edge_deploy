#!/bin/bash

while true; do
  # Get the list of running container IDs
  containers=($(docker ps -q))

  # Check if there are any running containers
  if [ ${#containers[@]} -eq 0 ]; then
    echo "No running containers to restart."
    exit 1
  fi

  # Determine the number of containers to restart (between 3 and the total number of running containers)
  num_containers=${#containers[@]}
  if [ $num_containers -lt 3 ]; then
    echo "Not enough containers to restart. At least 3 containers are required."
    exit 1
  fi
  num_to_restart=$(shuf -i 3-$num_containers -n 1)

  echo "Number of containers to restart: $num_to_restart"

  # Shuffle the container list and select the first num_to_restart containers
  selected_containers=($(echo "${containers[@]}" | tr ' ' '\n' | shuf -n $num_to_restart))

  for random_container in "${selected_containers[@]}"; do
    # Get the name of the selected container
    container_name=$(docker inspect --format '{{.Name}}' "$random_container" | sed 's/^\/\|\/$//g')

    # Echo the container name before restarting
    echo "Stopping container: $container_name ($random_container)"

    sleep 5

    # Restart the selected container
    docker stop "$random_container"

    # Echo the container name after restarting
    echo "Stopped container: $container_name ($random_container)"
  done

  for random_container in "${selected_containers[@]}"; do
    # Get the name of the selected container
    container_name=$(docker inspect --format '{{.Name}}' "$random_container" | sed 's/^\/\|\/$//g')

    # Echo the container name before restarting
    echo "Starting container: $container_name ($random_container)"

    sleep 5

    # Restart the selected container
    docker start "$random_container"

    # Echo the container name after restarting
    echo "Started container: $container_name ($random_container)"
  done

  # Sleep for a random time interval between 0 and 120 seconds
  sleep_time=$(shuf -i 0-120 -n 1)
  echo "Sleeping for $sleep_time seconds before the next restart cycle."
  sleep "$sleep_time"
done