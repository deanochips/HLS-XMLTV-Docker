#!/bin/bash
#--------------------------------------------------------------------------------------------------
#  _    _ _       _____        __  __   ____  __ _   _________      __
# | |  | | |     / ____|      / /  \ \ / /  \/  | | |__   __\ \    / /
# | |__| | |    | (___       / /    \ V /| \  / | |    | |   \ \  / / 
# |  __  | |     \___ \     / /      > < | |\/| | |    | |    \ \/ /  
# | |  | | |____ ____) |   / /      / . \| |  | | |____| |     \  /   
# |_|  |_|______|_____/   /_/      /_/ \_\_|  |_|______|_|      \/     
#                                                                                                                 
#                                                                                                                 
#  _    _  ____  __  __ ______   ____  _____   ____          _____   _____           _____ _______ _____ _   _  _____ 
# | |  | |/ __ \|  \/  |  ____| |  _ \|  __ \ / __ \   /\   |  __ \ / ____|   /\    / ____|__   __|_   _| \ | |/ ____|
# | |__| | |  | | \  / | |__    | |_) | |__) | |  | | /  \  | |  | | |       /  \  | (___    | |    | | |  \| | |  __ 
# |  __  | |  | | |\/| |  __|   |  _ <|  _  /| |  | |/ /\ \ | |  | | |      / /\ \  \___ \   | |    | | | . ` | | |_ |
# | |  | | |__| | |  | | |____  | |_) | | \ \| |__| / ____ \| |__| | |____ / ____ \ ____) |  | |   _| |_| |\  | |__| |
# |_|  |_|\____/|_|  |_|______| |____/|_|  \_\\____/_/    \_\_____/ \_____/_/    \_\_____/   |_|  |_____|_| \_|\_____|               
#
# Easy Concat List Maker Scipt.
#
#
# HLS / XMLTV Home broadcasting : https://github.com/deanochips/HLS-XMLTV---Home-Broadcasting
#
# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Dean Butler           2020-01-05      Initial version
# --------------------------------------------------------------------------------------------------

DOCKER_IMAGE_NAME="HLS-XMLTV"

# --------------------------------------------------------------------------------------------------
# define folder locations
# --------------------------------------------------------------------------------------------------
cd $(dirname ${BASH_SOURCE[0]})
#source ./config.cfg
# --------------------------------------------------------------------------------------------------
# define colours
# --------------------------------------------------------------------------------------------------

case $SHELL in
	*bash)
		ECHO='echo -e'
		;;
	*ash)
		ECHO='echo -e'
		;;
	*)
		ECHO='echo'
		;;
esac

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
black='\033[0;30m'
red='\033[0;31m'   
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
transparent="\e[0m"			

# Bold
BBlack='\033[1;30m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# Underline
UBlack='\033[4;30m'
URed='\033[4;31m'
UGreen='\033[4;32m'
UYellow='\033[4;33m'
UBlue='\033[4;34m'
UPurple='\033[4;35m'
UCyan='\033[4;36m'
UWhite='\033[4;37m'

# --------------------------------------------------------------------------------------------------
# Splash Screen
# --------------------------------------------------------------------------------------------------

SPLASH_SCREEN="ON" #Enable/Disable SPLASH SCREEN

function load_splash_screen () {
clear; ${ECHO} ""
sleep 0.01 && ${ECHO} "$green "
sleep 0.02 && ${ECHO} "  ██╗░░██╗██╗░░░░░░██████╗  ░░░░██╗  ██╗░░██╗███╗░░░███╗██╗░░░░░████████╗██╗░░░██╗"
sleep 0.02 && ${ECHO} "  ██║░░██║██║░░░░░██╔════╝  ░░░██╔╝  ╚██╗██╔╝████╗░████║██║░░░░░╚══██╔══╝██║░░░██║"
sleep 0.02 && ${ECHO} "  ███████║██║░░░░░╚█████╗░  ░░██╔╝░  ░╚███╔╝░██╔████╔██║██║░░░░░░░░██║░░░╚██╗░██╔╝"
sleep 0.02 && ${ECHO} "  ██╔══██║██║░░░░░░╚═══██╗  ░██╔╝░░  ░██╔██╗░██║╚██╔╝██║██║░░░░░░░░██║░░░░╚████╔╝░"
sleep 0.02 && ${ECHO} "  ██║░░██║███████╗██████╔╝  ██╔╝░░░  ██╔╝╚██╗██║░╚═╝░██║███████╗░░░██║░░░░░╚██╔╝░░"
sleep 0.02 && ${ECHO} "  ╚═╝░░╚═╝╚══════╝╚═════╝░  ╚═╝░░░░  ╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░░░░╚═╝░░░"
${ECHO} ""
sleep 0.02 && ${ECHO} "  ██╗░░██╗░█████╗░███╗░░░███╗███████╗"
sleep 0.02 && ${ECHO} "  ██║░░██║██╔══██╗████╗░████║██╔════╝"
sleep 0.02 && ${ECHO} "  ███████║██║░░██║██╔████╔██║█████╗░░"
sleep 0.02 && ${ECHO} "  ██╔══██║██║░░██║██║╚██╔╝██║██╔══╝░░"
sleep 0.02 && ${ECHO} "  ██║░░██║╚█████╔╝██║░╚═╝░██║███████╗"
sleep 0.02 && ${ECHO} "  ╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝╚══════╝"
${ECHO} ""
sleep 0.02 && ${ECHO} "  ██████╗░██████╗░░█████╗░░█████╗░██████╗░░█████╗░░█████╗░░██████╗████████╗██╗███╗░░██╗░██████╗░"
sleep 0.02 && ${ECHO} "  ██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║████╗░██║██╔════╝░"
sleep 0.02 && ${ECHO} "  ██████╦╝██████╔╝██║░░██║███████║██║░░██║██║░░╚═╝███████║╚█████╗░░░░██║░░░██║██╔██╗██║██║░░██╗░"
sleep 0.02 && ${ECHO} "  ██╔══██╗██╔══██╗██║░░██║██╔══██║██║░░██║██║░░██╗██╔══██║░╚═══██╗░░░██║░░░██║██║╚████║██║░░╚██╗"
sleep 0.02 && ${ECHO} "  ██████╦╝██║░░██║╚█████╔╝██║░░██║██████╔╝╚█████╔╝██║░░██║██████╔╝░░░██║░░░██║██║░╚███║╚██████╔╝"
sleep 0.02 && ${ECHO} "  ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░"
${ECHO} ""
sleep 0.01
${ECHO} $yellow"             for all your entertainment needs  ("$red"There is always something good on...."$yellow")"
sleep 0.01
${ECHO} $blue "           	      Made with <3 by:"$yellow" deanochips ("$red"deanochips@gmail.com"$yellow")"
sleep 0.01
${ECHO} ""
}

if [ -z "$SPLASH_RUN_YET" ] && [ "$SPLASH_SCREEN" = "ON" ]
then
SPLASH_RUN_YET="yes"
load_splash_screen
fi


trap ctrl_c INT

function ctrl_c() {
${ECHO} "$Color_Off "
clear
exit 
}



shopt -s extglob

show_menus() {
	sleep 0.01 && ${ECHO} "$green "
	printf -v _hr "%*s" $(tput cols) && echo ${_hr// /-}
	sleep 0.01 && ${ECHO} -ne "$BGreen "
	echo -ne "\033[1mDocker Script Launcher\033"
	sleep 0.01 && ${ECHO} "$green "
	printf -v _hr "%*s" $(tput cols) && echo ${_hr// /-}
	echo ""
	echo "1) Launch whole system, if first run it will do all caching now - (cron.sh)"
	echo "2) Kill a stream - (kill_stream.sh)"
	echo "3) Kill all stream - (killall ffmpeg)"
	echo "4) Clear Cache for Channels - (clear_cache.sh)"
	echo "5) Generate concat list from folders in your channels folder - (easy_concat_list_maker.sh)"
	echo "6) Enter Container and HLS-XMLTV location, type exit to get back to this menu, useful if you want to interact with stream_laucher.sh or generate_epg.sh directly"
	echo "7) Access docker crontab"
	echo "8) Edit config file (this can also be done in you mapped directory on your host)"
	echo "9) Enter log folder"

	echo ""
	echo "CTRL-C to Exit"
	echo ""

}

read_options(){
	printf -v _hr "%*s" $(tput cols) && echo ${_hr// /-}
	local choice
	read -p "Enter choice [ 1 - 9 ] " choice
	case $choice in
		1) docker exec -it  "$DOCKER_IMAGE_NAME" /HLS-XMLTV/cron.sh ;;
		2) docker exec -it  "$DOCKER_IMAGE_NAME" /HLS-XMLTV/kill_stream.sh ;;
		3) docker exec -it  "$DOCKER_IMAGE_NAME" /bin/bash -c "killall ffmpeg" ;;
		4) docker exec -it  "$DOCKER_IMAGE_NAME" /HLS-XMLTV/clear_cache.sh ;;
		5) docker exec -it  "$DOCKER_IMAGE_NAME" /HLS-XMLTV/easy_concat_list_maker.sh ;;
		6) docker exec -it  "$DOCKER_IMAGE_NAME" /bin/sh -c "cd /HLS-XMLTV; /bin/bash" ;;
		7) docker exec -it  "$DOCKER_IMAGE_NAME" /bin/bash -c "export VISUAL=nano; crontab -e" ;;
		8) docker exec -it  "$DOCKER_IMAGE_NAME" /bin/bash -c "nano /HLS-XMLTV/config.cfg" ;;
		9) docker exec -it  "$DOCKER_IMAGE_NAME" /bin/bash -c "cd /tmp/hxhb; /bin/bash" ;;


		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
	clear
	unset $SPLASH_RUN_YET
	load_splash_screen
}

while true
do
	show_menus
	read_options
done
