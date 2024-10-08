#!/bin/sh
#
# Install software necessary for bootstrapping the system
# for installation and configuration.
#
# Install distrobox (https://github.com/89luca89/distrobox)

if [ $(command -v distrobox) ]
then
  echo Distrobox already installed.
else
  echo Installing distrobox...
  curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
fi


# Install Just (https://github.com/casey/just)

if [ $(command -v just) ]
then
  echo Just already installed.
else
  echo Installing just...
  curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to "${HOME}/.local/bin"
fi
