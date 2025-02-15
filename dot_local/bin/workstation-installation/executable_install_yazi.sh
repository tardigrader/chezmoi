#!/bin/bash

# Install yazi file mangager (https://github.com/sxyazi/yazi)

curl -fsSL \
  https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip \
  --output "/tmp/yazi.zip"
unzip -q /tmp/yazi.zip -d /tmp
cp /tmp/yazi-x86_64-unknown-linux-musl/{ya,yazi} "$HOME/.local/bin" || echo "Failed to install yazi"
cp -r /tmp/yazi-x86_64-unknown-linux-musl/completions/ ~/.local/share/yazi || echo "Failed to install yazi"
