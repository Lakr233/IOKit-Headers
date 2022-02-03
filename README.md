# IOKit Headers

> Use the script inside WebKit tool list "make Xcode ready for embed development" is recommended.

This repository contains IOKit headers along with its belongings to functional properly.

Execute deploy.sh will send these headers to Xcode SDK folder and then you can import them via #include <IOKit/IOKit.h>

Affected folders:

- IOKIT_HEADER_PATH="$SDKPATH/System/Library/Frameworks/IOKit.framework/Headers/"
- IOSURFACE_HEADER_PATH="$SDKPATH/System/Library/Frameworks/IOSurface.framework/Headers/"
- LIBKERN_HEADER_PATH="$SDKPATH/usr/include/libkern"

meanwhile the SDKPATH is written to belongings

    "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk"

2021-02-02
Copyright © 2021 Apple(maybe?). All rights not reserved.
