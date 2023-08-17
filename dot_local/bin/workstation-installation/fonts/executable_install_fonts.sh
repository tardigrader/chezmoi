#!/bin/bash
#
set -euo pipefail

CONTAINER_ENV=
FONTS_DIR="${HOME}/.local/share/fonts"
declare -A FONTS_ARR=( \
  [EnvyCodeR]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/EnvyCodeR.zip" \
  [FiraCode]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip" \
  [FiraMono]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip" \
  [IosevkaTerm]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IosevkaTerm.zip" \
  [Iosevka]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip" \
  [Monofur]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Monofur.zip" \
  [IBMPlex]="https://github.com/IBM/plex/releases/download/v6.3.0/TrueType.zip" \
  [Inconsolata]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Inconsolata.zip" \
)

# Are we inside a container?
if [ -e /run/.containerenv ]
then
  CONTAINER_ENV=1
fi

# Create fonts directory in $HOME/.local/share/fonts.
# $HOME/.fonts seems deprecated. Who knew?
if [ ! -d "${FONTS_DIR}" ]; then
    echo "Creating fonts directory: mkdir -p $FONTS_DIR"
    mkdir -p "${FONTS_DIR}"
else
    echo "Found fonts dir $FONTS_DIR"
fi

# Download fonts
# TODO: Fonts should probably not be downloaded _again_ if they already
# exist in the directory.
for font in "${!FONTS_ARR[@]}"
do
  echo "Downloading font => ${font}"
  curl --silent --fail --location --show-error "${FONTS_ARR[$font]}" --remote-name
done

# ...and unzip info $FONTS_DIR

echo "Installing fonts in ${FONTS_DIR}"
unzip -o -q -d "${FONTS_DIR}" "*.zip"

# Update font cache
if [ -n "${CONTAINER_ENV}" ]
then
  echo "We are in a container. Trying distrobox-host-exec to update font cache."
  distrobox-host-exec fc-cache && echo "Font cache updated." \
    || echo "Font cache not updated. Try fc-cache manually."
else
  echo "Updating font cache..."
  fc-cache -f
fi

# Clean up
rm ./*.zip
