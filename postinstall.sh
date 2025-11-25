#!/bin/bash

cat >> '/home/vscode/.environment' << EOF
# global environment
export ANDROID_HOME="/opt/android/sdk"
export PATH="\$PATH:/opt/flutter/bin"
export PATH="\$PATH:/opt/android/sdk/cmdline-tools/latest/bin"
export PATH="\$PATH:/opt/android/sdk/platform-tools"
export PATH="\$PATH:/opt/android/sdk/build-tools/36.1.0"
EOF

echo 'Add environment to ~/.profile...'
echo "source '/home/vscode/.environment'" >> '/home/vscode/.profile'
echo 'Add environment to ~/.zprofile...'
echo "source '/home/vscode/.environment'" >> '/home/vscode/.zprofile'
source '/home/vscode/.environment'

echo 'Installing Android Platform 34...'
yes | sdkmanager 'platforms;android-34'

echo 'Installing Android Platform 35...'
yes | sdkmanager 'platforms;android-35'

echo 'Installing Android Platform 36...'
yes | sdkmanager 'platforms;android-36'

echo 'Installing tools...'
yes | sdkmanager 'platform-tools' 'build-tools;35.0.0' 'build-tools;36.1.0'

flutter config --android-sdk '/opt/android/sdk'
yes | flutter doctor --android-licenses

# disable telemetry
echo 'Disabling anaytics...'
flutter --disable-analytics
dart --disable-analytics
