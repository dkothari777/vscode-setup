#!/usr/bin/env bash

set -eu -o pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ "$(uname -s)" != "Darwin" ]; then
	echo "Error: this setup only runs on mac!" 
	exit 1
fi

if ! command -v brew >/dev/null ; then 
	echo "Error: Homebrew is not installed!" 
	exit 1
fi
echo "Hombrew installing Visual Studio Code..."
brew install --cask visual-studio-code
echo
echo "Installing extensions..."
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension golang.go
code --install-extension hashicorp.terraform
code --install-extension k--kato.intellij-idea-keybindings
code --install-extension mohsen1.prettify-json
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension Pivotal.vscode-spring-boot
code --install-extension redhat.ansible
code --install-extension redhat.java
code --install-extension redhat.vscode-yaml
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-dependency
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven
code --install-extension vscjava.vscode-spring-initializr
code --install-extension yzhang.markdown-all-in-one
echo 
echo "Copying settings over..."
cp ${SCRIPT_DIR}/settings.json $HOME/Library/Application\ Support/Code/User/
