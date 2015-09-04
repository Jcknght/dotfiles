###############################################################################
#
# File Name         : barout.sh
# Created By        : Jack Avlis
# Creation Date     : septembre  4th, 2015
# Version           : 0.1
# Last Change       : septembre  4th, 2015 at 17:36:00
# Last Changed By   : Jack Avlis
# Purpose           : Description
#
###############################################################################
#!/bin/bash

battery(){
	batt=$(acpi -b | awk -F' ' '{print $4""; if ($3 == "Unknown,") print "="; else if ($3 == "Discharging,") print "("substr($5,0,5)")"; else if ($3 == "Charging,") print "⚡- "; else print "("$3")"}' | sed -e 's/,//' |     tr '\n' ' ')
	echo "[Bat: $batt]"
}

MESSAGE=$@
TAILLE=${#MESSAGE}

duration=3

# define geometry
barx=15
bary=15
barw=$((150+(9*$TAILLE)))
barh=20

#colors
bar_bg='#333333'
bar_fg='#1B1B24'
#bar_fg='#ffffff'

(echo " $@ $(battery) "; sleep ${duration}) | lemonbar -g ${barw}x${barh}+${barx}+${bary} -B ${bar_bg} -f "-*-fixed-medium-*-*-*-15-*-*-*-*-*-*-*"
