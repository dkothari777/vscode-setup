#!/usr/bin/env bash

set -eu -o pipefail

DEVCONTAINER_TYPE=${1:-"infra"}

DEVCONTAINER_JSON=$(cat <<EOF
{
    "image": "dkothari777/vscode-devcontainer:${DEVCONTAINER_TYPE}_latest"
}
EOF
)

mkdir -p .devcontainer
pushd .devcontainer
echo "${DEVCONTAINER_JSON}" > devcontainer.json 
popd