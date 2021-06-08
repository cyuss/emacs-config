#!/usr/bin/env bash
set -euo pipefail

# download and install emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --with-elrumo1-icon

# install doom emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
