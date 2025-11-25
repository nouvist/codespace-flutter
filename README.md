# Codespace Flutter Docker Image

A Docker image that includes Flutter, the Android SDK, and Netbird for GitHub
Codespaces, letting you develop in the cloud and connect to your real device
with ease.

## Usage

Just drop this into your `devcontainer.json` and you won't have to build it
manually.

```json
{
  "name": "Flutter Codespace",
  "image": "ghcr.io/nouvist/codespace-flutter:latest",
  "remoteUser": "vscode",
  "features": {
    "ghcr.io/devcontainers/features/common-utils": {
      "installZsh": true,
      "configureZshAsDefaultShell": true,
      "installOhMyZsh": true,
      "username": "vscode",
      "upgradePackages": false
    },
    "ghcr.io/devcontainers/features/github-cli:1": {},
    "ghcr.io/devcontainers/features/sshd:1": {
      "version": "latest"
    }
  },
  "customizations": {
    "vscode": {
      "extensions": ["Dart-Code.dart-code", "Dart-Code.flutter"]
    }
  },
  // Following fields are only required for use with Netbird
  "runArgs": ["--device=/dev/net/tun"],
  "capAdd": ["NET_ADMIN", "NET_RAW"]
}
```

## License

The MIT License in this repository covers only the shell scripts, GitHub Actions
files, and Dockerfile. The resulting image contains Flutter, the Android SDK,
Netbird, and other third-party components, each under their own licenses.

By using the resulting image, you acknowledge and agree that the included
third-party software is governed by its respective licenses, and you are
responsible for complying with those terms.
