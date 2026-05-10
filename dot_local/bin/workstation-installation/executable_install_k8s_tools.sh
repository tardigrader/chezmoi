#!/bin/bash

# Install kubernetes command line tools

# Install kubectl
LATEST_KUBECTL=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -fsSL "https://dl.k8s.io/release/${LATEST_KUBECTL}/bin/linux/amd64/kubectl" --output /tmp/kubectl
curl -fsSL "https://dl.k8s.io/release/${LATEST_KUBECTL}/bin/linux/amd64/kubectl.sha256" --output /tmp/kubectl.sha256
echo "Validating kubectl checksum"
echo "$(cat /tmp/kubectl.sha256)  /tmp/kubectl" | sha256sum --check && echo "Installing kubectl" && 
  mv /tmp/kubectl "${HOME}"/.local/bin
chmod +x "${HOME}"/.local/bin/kubectl

# Install krew
echo "Installing krew"
curl -fsSL "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz" --output /tmp/krew.tar.gz
tar zxf /tmp/krew.tar.gz -C /tmp && /tmp/krew-linux_amd64 install krew
echo "export PATH=${KREW_ROOT:-$HOME/.krew}/bin:$PATH" >> "${HOME}/.bashrc"


# Install helm
LATEST_HELM=$(curl -s https://get.helm.sh/helm-latest-version) && 
curl -fsSL https://get.helm.sh/helm-"${LATEST_HELM}"-linux-amd64.tar.gz --output /tmp/helm.tgz
echo "Installing helm"
tar xfz /tmp/helm.tgz -C "$HOME"/.local/bin linux-amd64/helm --strip-components=1

# Install crane
#
LATEST_CRANE=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')
curl -fsSL "https://github.com/google/go-containerregistry/releases/download/${LATEST_CRANE}/go-containerregistry_Linux_x86_64.tar.gz" --output /tmp/crane.tar.gz
echo "Installing crane"
tar xfz /tmp/crane.tar.gz -C "${HOME}"/.local/bin/ crane

# Install kind
#
echo "Installing kind"
curl -fsSL https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64 --output "${HOME}"/.local/bin/kind
chmod +x "${HOME}"/.local/bin/kind

# Install grype

echo "Installing grype"
curl -fsSL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b "${HOME}"/.local/bin/
#
# Install trivy
#
# Install dive
