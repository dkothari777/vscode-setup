#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_REPO_URL=${1:-"dkothari777"}
DOCKER_REPO=${2:-"vscode-devcontainer"}

for dockerfile in $(ls Dockerfile*); do
	IMAGE_NAME="$(echo ${dockerfile} | cut -d "." -f2)"
	TAG_NAME="${DOCKER_REPO_URL}/${DOCKER_REPO}:${IMAGE_NAME}"
	CURR_DATE="$(date +%Y-%m-%d)"
	docker build . -f ${dockerfile} -t "${TAG_NAME}_${CURR_DATE}"
    docker push "${TAG_NAME}_${CURR_DATE}"
    docker tag "${TAG_NAME}_${CURR_DATE}" "${TAG_NAME}_latest"
    docker push "${TAG_NAME}_latest" 
done	
