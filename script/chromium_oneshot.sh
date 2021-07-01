#!/bin/bash 

echo -e "\033[32m CREATE SOURCE DIRECTORY \033[0m"
mkdir ~/chromium && cd ~/chromium

echo -e "\033[32m FETCH CHROMIUM SOURCE \033[0m"
fetch --nohooks chromium

echo -e "\033[32m ENTERING SOURCE DIRECTORY \033[0m"
cd src

echo -e "\033[32m DOWNLOAD ADDITIONAL BINARY (RUNHOOKS) \033[0m"
gclient runhooks

echo -e "\033[32m CREATE OUTPUT DIRECTORY \033[0m"
gn gen out/Default

echo -e "\033[32m SET GN ARGUMENTS \033[0m"
gn args out/Default/ --list --args="enable_nacl=false symbol_level=0 blink_symbol_level=0"

echo -e "\033[32m CHECKOUT LOCAL BRANCH \033[0m"
git checkout -b mywork -t origin/master

echo -e "\033[32m BUILD CHROMIUM \033[0m"
autoninja -C out/Default chrome

#echo -e "\033[32m BUILD BLINK_TESTS \033[0m"
#autoninja -C out/Default blink_tests

echo -e "\033[32m ALL TASKS ARE DONE \033[0m"
