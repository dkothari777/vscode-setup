#!/usr/bin/env bash

set -eu -o pipefail

DEVCONTAINER_TYPE=${1:-"infra"}

DEVCONTAINER_JSON=$(cat <<EOF
{
    "image": "dkothari777/vscode-devcontainer:${DEVCONTAINER_TYPE}_latest",
    "mounts": ["source=${localEnv:HOME}/.ssh/,target=/root/.ssh/,type=bind,readonly,consistency=cached"],
    "postAttachCommand": "git config --global core.editor \"code --wait\""
}
EOF
)

mkdir -p .devcontainer
pushd .devcontainer
echo "${DEVCONTAINER_JSON}" > devcontainer.json 
popd