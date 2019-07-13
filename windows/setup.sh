#!/bin/bash

set -e

choco_app_list="googlechrome git.install putty.install autohotkey vscode github-desktop slack dropbox cmder spotify llvm python virtualbox foxitreader vlc mobaxterm make ninja cmake curl firefox 7zip "

currDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${currDir}
#----------------------------------------------------------------------------------------------------------

choco install -Y ${choco_app_list}

# symlink on git bash is weird
ln -sfv ${currDir}/cmder/ConEmu.xml /c/tools/Cmder/vendor/conemu-maximus5/ConEmu.xml

git submodule init
git submodule update

# vscode stuffs
bash ../fedora_kd/userland/vscode/vscode_extension.sh
bash ../fedora_kd/userland/vscode/vscode_configure.sh
# replace fonts for windows
sed -ie 's:source code pro:Consolas:g' $APPDATA/Code/User/settings.json