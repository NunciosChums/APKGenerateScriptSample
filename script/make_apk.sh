#! /bin/bash

RED=`tput setaf 1`
RESET=`tput sgr0`

echo -e "${RED}@@@@@@@@@@@@@@@ 바탕화면에 apk 만들기 @@@@@@@@@@@@@@@${RESET}\n"

cd `dirname "$0"`

cd ../TestApp
rm -rf app/build/outputs/apk/*

# echo -e "${RED}############ Debug ############${RESET}\n"
# bash ./gradlew assembleDebug
# APK_FOLDER="app/build/outputs/apk/debug"

echo -e "${RED}############  Release ############${RESET}\n"
bash ./gradlew assembleRelease
APK_FOLDER="app/build/outputs/apk/release"

APP_VERSION=`sed -e 's/^.*"versionName":"\([^"]*\)".*$/\1/' ${APK_FOLDER}/output.json`
mv ${APK_FOLDER}/*.apk ~/Desktop/TestApp_v"${APP_VERSION}".apk

read -rep "${RED}아무 키나 누르세요. 5초 뒤에 자동으로 닫힙니다.${RESET}"$'\n' -n1 -s -t 5
