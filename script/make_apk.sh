#! /bin/bash

RED=`tput setaf 1` # 빨간색 시작
RESET=`tput sgr0` # 원래 색으로 되돌리기

echo -e "${RED}@@@@@@@@@@@@@@@ 바탕화면에 apk 만들기 @@@@@@@@@@@@@@@${RESET}\n"

cd `dirname "$0"` # 바로가기 아이콘으로 실행했을 때를 위해 make_apk.sh 파일이 있는 곳으로 이동.

cd ../TestApp # 앱 경로로 이동
rm -rf app/build/outputs/apk/* # 기존의 apk 파일 모드 제거

# echo -e "${RED}############ Debug ############${RESET}\n"
# bash ./gradlew assembleDebug
# APK_FOLDER="app/build/outputs/apk/debug"

echo -e "${RED}############  Release ############${RESET}\n"
bash ./gradlew assembleRelease
APK_FOLDER="app/build/outputs/apk/release"

APP_VERSION=`sed -e 's/^.*"versionName":"\([^"]*\)".*$/\1/' ${APK_FOLDER}/output.json` # output.json 에서 versionName 가져오기
mv ${APK_FOLDER}/*.apk ~/Desktop/TestApp_v"${APP_VERSION}".apk # 바탕화면으로 파일 이동

read -rep "${RED}아무 키나 누르세요. 5초 뒤에 자동으로 닫힙니다.${RESET}"$'\n' -n1 -s -t 5 # 5초 후 터미널 닫기
