#!/bin/bash
#
FONTS_DIR="${HOME}/.local/share/fonts"
# TODO: It would be clearer if this was an associative array with the 
# font name as a key.
FONTS_ARR=( \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/EnvyCodeR.zip" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IosevkaTerm.zip" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Monofur.zip" \
  "https://github.com/IBM/plex/releases/download/v6.3.0/TrueType.zip" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Inconsolata.zip" \
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
for font in "${FONTS_ARR[@]}"
do
  echo "Downloading font => ${font}"
  curl --silent --fail --location --show-error "${font}" --remote-name
done

# ...and unzip info $FONTS_DIR
unzip -o -q -d "${FONTS_DIR}" "*.zip"

# Update font cache
if [ -z "${CONTAINER_ENV}" ]
then
  echo "We are in a container. Trying distrobox-host-exec to update font cache."
  distrobox-host-exec fc-cache || echo "Font cache not updated. Try fc-cache manually."
else
  echo "fc-cache -f"
fi

# TODO: Remove downloaded zips
rm -iv *.zip
