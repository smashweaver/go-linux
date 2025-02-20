# Install Go on Linux

This script streamlines the process of installing the Go programming language on your Linux system. It automates the download, extraction, and setup, making it easy to get started with Go development. Check the releases page here https://go.dev/dl/ for more information about the available versions.

### Features

- Downloads the latest stable Go version by default (configurable)
- Allows overriding the default version with a command-line argument
- Provides informative messages during the installation process
- Sets up environment variables in .profile and creates Go workspace
- Verifies the successful installation

### Usage

**1. Download the script:**

```bash
curl https://raw.githubusercontent.com/smashweaver/go-linux/main/install.sh > installgo.sh
```

**2. Execute the script**

Install the latest stable version: _1.23.2_

```bash
bash ./installgo.sh
```

or specify a previous 1.22.x version like so:

```bash
bash ./installgo.sh 1.22.8
```

**Note:** After installation, you'll need to either log out and log back in, or run `source ~/.profile` to apply the environment changes
