#!/bin/bash

# Variables for the colors
black="#181818"
blue="#7CAFC2"
orange="#DC9656"
purple="#BA8BAF"
mint="#9EE6DA"
mocha="#D2BFB1"
babyblue="#B8E5FC"
blugrey="#bbccdd"
navyblu="#223344"
khakigreen="#556644"
lkhakigreen="#889977"

clock(){
	# Displays the date "Sun 17 May 9:10 AM"
	date '+%a %d %b %l:%M %p'
}

memory(){
	# Show free memory  "Free/Total MB"
	free -m | awk '/Mem:/ {print "⭦ " $3, "/ " $2 " MB"}'
}

window(){
	# Grabs focused window's title
	title=$(xdotool getactivewindow getwindowname)
	echo "$title" | cut -c 1-40 # Limits the output to a maximum of 40 chars
}

music(){
        songstatus=$(/home/hrfee/bin/cmus-now-playing.sh)
				vollevel=$(amixer get Master | egrep -o "[0-9]+%" | head -n 1)
				echo "♫ $songstatus @ $vollevel Volume"
}

while :; do
	echo "%{l}%{B$navyblu} $(window)  %{l}%{r}%{B$lkhakigreen}  $(music)  %{B$khakigreen}  $(memory)  %{B$navyblu}  ⭧ $(clock)  %{B$blugrey}%{r}"

	# The window functions needs a tiny delay, anything longer and it becomes unresponsive.
	# Having no delay causes the cpu usage to go around 6-10% on my system, the .1s delay brings thar right down.
	sleep .1s
done
