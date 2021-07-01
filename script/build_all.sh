#!/bin/bash 

BUILDLIST=(
chrome
components_unittests
content_unittests
services_unittests
net_unittests
)

for target in "${BUILDLIST[@]}"; do
	echo -e "\033[32m BUILD $target\033[0m"
	autoninja -C out/Default $target
done
