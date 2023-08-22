#!/bin/bash

# Install starship prompt (https://starship.rs/)

curl -fsSL https://starship.rs/install.sh --create-dirs --output "/tmp/starship-installer"
chmod +x /tmp/starship-installer
/tmp/starship-installer --yes --bin-dir "${HOME}/.local/bin"
