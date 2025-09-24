#!/bin/zsh

VERSION="$(curl -fsSL https://api.github.com/repos/lima-vm/socket_vmnet/releases/latest | jq -r .tag_name)"
FILE="socket_vmnet-${VERSION:1}-$(uname -m).tar.gz"

# Download the binary archive
curl -OSL "https://github.com/lima-vm/socket_vmnet/releases/download/${VERSION}/${FILE}"

# (Optional) Attest the GitHub Artifact Attestation using GitHub's gh command (https://cli.github.com)
gh attestation verify --owner=lima-vm "${FILE}"

# (Optional) Preview the contents of the binary archive
tar tzvf "${FILE}"

# Install /opt/socket_vmnet from the binary archive
sudo tar Cxzvf / "${FILE}" opt/socket_vmnet