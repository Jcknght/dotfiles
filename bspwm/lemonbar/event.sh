###############################################################################
#
# File Name         : event.sh
# Created By        : Jack Avlis
# Creation Date     : septembre  4th, 2015
# Version           : 0.1
# Last Change       : septembre  4th, 2015 at 17:52:15
# Last Changed By   : Jack Avlis
# Purpose           : Description
#
###############################################################################
#!/bin/bash

TAILLE=${#MESSAGE}

duration=3

# define geometry
barx=15
bary=15
barw=150
barh=20
 
#colors
bar_bg='#333333'
bar_fg='#1B1B24'


duration=3

battery(){
batt=$(acpi -b | awk -F' ' '{print $4"";}' | sed -e 's/,// ' | tr '\n' ' ')
	echo " $batt "
}


(echo "$(battery)"; sleep ${duration}) | lemonbar -g ${barw}x${barh}+${barx}+${bary} -B ${bar_bg} -f "-*-fixed-medium-*-*-*-15-*-*-*-*-*-*-*"
