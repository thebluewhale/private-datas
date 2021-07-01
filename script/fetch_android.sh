#!/bin/bash 

echo -e "\033[32m CREATE SOURCE DIRECTORY \033[0m"
mkdir ~/chromium && cd ~/chromium

echo -e "\033[32m FETCH ANDROID CHROMIUM SOURCE \033[0m"
fetch --no-history --nohooks android

echo -e "\033[32m ENTERING SOURCE DIRECTORY \033[0m"
cd src

echo -e "\033[32m CONVERTING AN EXISTING LINUX CHECKOUT \033[0m"
gclient sync

#echo -e "\033[32m INSTALL BUILD DEPS \033[0m"
#build/install-build-deps-android.sh

echo -e "\033[32m DOWNLOAD ADDITIONAL BINARY (RUNHOOKS) \033[0m"
gclient runhooks

echo -e "\033[32m CREATE OUTPUT DIRECTORY \033[0m"
gn gen out/Default

echo -e "\033[32m SET GN ARGUMENTS \033[0m"
gn args out/Default/ --list --args='target_os="android" target_cpu="arm64"'

echo -e "\033[32m BUILD CHROMIUM \033[0m"
autoninja -C out/Default chrome_public_apk

echo -e "\033[32m ALL TASKS ARE DONE \033[0m"
