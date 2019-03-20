#!/bin/bash

set -e

choco_app_list="googlechrome git.install putty.install autohotkey.portable vscode github-desktop slack dropbox cmder spotify llvm python virtualbox foxitreader vlc mobaxterm "

currDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${currDir}
#----------------------------------------------------------------------------------------------------------

choco install -y ${choco_app_list}

# TODO: add scoop app list if possible

# symlink on git bash is weird
cp -v cmder/ConEmu.xml /c/tools/Cmder/vendor/conemu-maximus5/ConEmu.xml

git submodule init
git submodule update

# vscode stuffs
bash ../fedora_kd/userland/vscode/vscode_extension.sh
# replace fonts for windows
sed -ie 's:source code pro:Consolas:g' $APPDATA/Code/User/settings.json
bash ../fedora_kd/userland/vscode/vscode_configure.sh