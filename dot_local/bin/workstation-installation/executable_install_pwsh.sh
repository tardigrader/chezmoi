#!/bin/bash

# Install powershell
#
###################################
# Prerequisites

# Get version of RHEL
source /etc/os-release
if [ ${VERSION_ID%.*} -lt 8 ]
  then majorver=7
elif [ ${VERSION_ID%.*} -lt 9 ]
  then majorver=8
else majorver=9
fi

# Download the Microsoft RedHat repository package
curl -q -sSL -O https://packages.microsoft.com/config/rhel/$majorver/packages-microsoft-prod.rpm

# Register the Microsoft RedHat repository
sudo rpm -i --quiet packages-microsoft-prod.rpm

# Delete the downloaded package after installing
rm packages-microsoft-prod.rpm

# Update package index files
sudo dnf -q update
# Install PowerShell
sudo dnf -q install powershell -y
