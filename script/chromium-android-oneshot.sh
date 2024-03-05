#!/bin/bash 

echo -e "\033[32m CREATE SOURCE DIRECTORY \033[0m"
mkdir /home/marc/chromium-android
cd /home/marc/chromium-android/

echo -e "\033[32m FETCH CHROMIUM SOURCE \033[0m"
fetch --nohooks android

if [ -d '/home/marc/chromium-android/src' ]; then
	echo "fetch done"
else
	echo "fetch failed"
	exit 0
fi

echo -e "\033[32m ENTERING SOURCE DIRECTORY \033[0m"
cd /home/marc/chromium-android/src

echo -e "\033[32m RUN HOOKS \033[0m"
gclient runhooks

echo -e "\033[32m CREATE OUTPUT DIRECTORY \033[0m"
gn gen out/Default

echo -e "\033[32m SET GN ARGUMENTS \033[0m"
gn args out/Default/ --list --args='target_os="android" target_cpu="x64" is_component_build=true is_java_debug=true treat_warnings_as_errors=false'

echo -e "\033[32m CHECKOUT LOCAL BRANCH \033[0m"
git checkout -b mywork -t origin/main

echo -e "\033[32m BUILD CHROMIUM \033[0m"
autoninja -C out/Default chrome_public_apk

echo -e "\033[32m ALL TASKS ARE DONE \033[0m"
