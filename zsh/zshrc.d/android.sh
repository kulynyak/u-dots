#!/bin/zsh

### install macos
#
# brew install android-studio
# brew install --cask temurin
# brew install --cask android-commandlinetools
# sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"
###

# Set ANDROID_HOME based on the operating system
case "$__OS" in
Darwin)
  # ANDROID_SDK_ROOT=$(brew info --cask android-commandlinetools | awk -F 'Default Android SDK root is' '{if ($2 != "") print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
  ANDROID_SDK_ROOT=/opt/homebrew/share/android-commandlinetools
  if [[ -d $ANDROID_SDK_ROOT ]]; then
    export ANDROID_SDK_ROOT
    export ANDROID_HOME=$ANDROID_SDK_ROOT
    export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$PATH"
  fi
  ;;
Fedora)
  # Optionally set ANDROID_HOME for Fedora or leave it empty
  ANDROID_HOME="" # or set it accordingly
  ;;
*)
  # Handle other OS cases or do nothing
  ANDROID_HOME=""
  ;;
esac
