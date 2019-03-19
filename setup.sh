#!/bin/bash

set -e

choco_app_list="googlechrome git.install putty.install autohotkey.portable vscode github-desktop slack dropbox cmder spotify \
llvm python virtualbox foxitreader vlc mobaxterm "

#----------------------------------------------------------------------------------------------------------

choco install -y ${choco_app_list}

# TODO: add scoop app list if possible

# TODO: figure out how to configure cmder

# vscode stuffs
# TODO: Make this a git submodule
if [ ! -d fedora_kd ]; then
git clone https://github.com/khoitd1997/fedora_kd.git
fi
bash fedora_kd/userland/vscode/vscode_extension.sh
# replace fonts for windows
sed -ie 's:source code pro:Consolas:g' fedora_kd/userland/vscode/settings.json
bash fedora_kd/userland/vscode/vscode_configure.sh
rm -rf fedora_kd