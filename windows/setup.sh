#!/bin/bash

set -e

choco_app_list="googlechrome git.install putty.install autohotkey vscode github-desktop slack dropbox spotify llvm python virtualbox mobaxterm make ninja cmake curl firefox neovim nano 7zip "
currDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#----------------------------------------------------------------------------------------------------------

choco install -Y ${choco_app_list}

git submodule update --init --remote

# vscode stuffs
bash ../fedora_kd/userland/vscode/vscode_extension.sh
bash ../fedora_kd/userland/vscode/vscode_configure.sh
# replace fonts for windows
sed -ie 's:source code pro:Consolas:g' $APPDATA/Code/User/settings.json