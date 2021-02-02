#!/bin/bash

echo "this is kinda WIP so give it up for now"

if [ ! $(uname) == "Darwin" ]
then
    echo "Script for Mac OS X only"
    exit
fi

cd "$(dirname "$0")"
echo "Deploying IOKit"

if [ -d "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk" ];
then
    SDKPATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk"
    echo "Found iOS SDK at $SDKPATH"
else
    echo "iOS SDK not found at"
    echo "--> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk"
    exit -1
fi

# if [ -f "$SDKPATH/System/Library/Frameworks/IOKit.framework/Headers/IOKitLib.h" ]; then
#     echo "IOKit headers exists"
#     echo "clean before redeploy"
#     exit 0
# fi

IOKIT_HEADER_PATH="$SDKPATH/System/Library/Frameworks/IOKit.framework/Headers/"
IOSURFACE_HEADER_PATH="$SDKPATH/System/Library/Frameworks/IOSurface.framework/Headers/"
LIBKERN_HEADER_PATH="$SDKPATH/usr/include/libkern"

# macOS xpc will not work on iOS
# XPC_HEADER_PATH="$SDKPATH/usr/include/xpc"

echo "Permission may be required before we can deploy headers"

sudo echo "Permission acquired?"

echo "Sending headers to: $IOKIT_HEADER_PATH"
sudo rm -rf $IOKIT_HEADER_PATH
sudo mkdir $IOKIT_HEADER_PATH
sudo cp -r ./IOKit/* $IOKIT_HEADER_PATH

echo "Sending headers to: $IOSURFACE_HEADER_PATH"
sudo rm -rf $IOSURFACE_HEADER_PATH
sudo mkdir $IOSURFACE_HEADER_PATH
sudo cp -r ./IOSurface/* $IOSURFACE_HEADER_PATH

echo "Sending headers to: $LIBKERN_HEADER_PATH"
sudo rm -rf $LIBKERN_HEADER_PATH
sudo mkdir $LIBKERN_HEADER_PATH
sudo cp -r ./libkern/* $LIBKERN_HEADER_PATH

# echo "Sending headers to: $XPC_HEADER_PATH"
# sudo rm -rf $XPC_HEADER_PATH
# sudo mkdir $XPC_HEADER_PATH
# sudo cp -r ./xpc/* $XPC_HEADER_PATH

echo "Deploy completed"
