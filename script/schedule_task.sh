#!/bin/bash

for i in {1...7200};
do
	sleep 1
done
	
cd chromium/src
gclient sync
gclient runhooks
gn gen out/Default
gn args out/Default --list --args='target_os="android" target_cpu="arm64"'
autoninja -C out/Default chrome_public_apk

echo 'done'
