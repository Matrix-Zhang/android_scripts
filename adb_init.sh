#!/bin/bash - 
#===============================================================================
#
#          FILE: android.sh
# 
#         USAGE: ./android.sh 
# 
#   DESCRIPTION: 脚本用于自动设置adb初始环境
# 
#       OPTIONS: ---
#  REQUIREMENTS: 必须要以管理员身份运行
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Matrix
#  ORGANIZATION: Zhi-tech
#       CREATED: 2015年08月21日 15:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

ini_file=~/.android/adb_usb.ini

usb_devices=`lsusb | grep -i "Spreadtrum"`

if [[ -z $usb_devices ]]
then
	echo "The Spreadtrum's device is not exist in the system."
fi

echo "#This file is generate by matrix's scrpit." > $ini_file

echo "$usb_devices" | awk '{print $6}' | sed -r -e 's/.*/0x&/' -e 's/:.*//' > $ini_file

echo "Everything is OK! You should run :"
echo -e "\tsudo adb kill-server"
echo -e "\tsudo adb start-server"
echo

exit 0
