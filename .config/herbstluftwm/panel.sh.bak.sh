#!/bin/bash

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
# geometry has the format: WxH+X+Y
x=${geometry[0]}
y=${geometry[1]}
width=${geometry[2]}
height=14
#font="-windows-montecarlo-medium-r-normal--11-110-72-72-c-60-microsoft-cp1252"
font="-*-*-*-r-normal-*-10-*-*-40-c-*-*-*"
# font="-*-terminus-normal-*-*-*-9-*-*-*-*-*-*-*"
bgcolor='#151515'

function uniq_linebuffered() {
    awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

herbstclient pad $monitor $height
{
    # events:
    while true ; do
      if ! mpc status >/dev/null; then
         sleep 5
      else
         echo "player $(mpc current)"
         mpc idleloop player
      fi
    done &

    while true ; do
        date +'date ^fg(#ffffff)%A %d %B ^fg(#ffffff)%H:%M'
        sleep 1 || break
    done > >(uniq_linebuffered)  &
    childpid=$!
    herbstclient --idle
    kill $childpid
} 2> /dev/null | {
    TAGS=( $(herbstclient tag_status $monitor) )
    date=""
    while true ; do
        bordercolor="#26221C"
        hintcolor="#222222"
        separator="^fg(#141414)^ro(1x$height)^fg()"
        # draw tags
        for i in "${TAGS[@]}" ; do
            case ${i:0:1} in
                '#')
                    echo -n "^bg(#5496ff)^fg(#141414)"
                    ;;
                '+')
                    echo -n "^bg(#808080)^fg(#141414)"
                    ;;
                ':')
                    echo -n "^bg(#404040)^fg(#141414)"
                    ;;
                '!')
                    echo -n "^bg(#ff8f00)^fg(#141414)"
                    # echo -n "^bg(#ffffff)^fg(#141414)"
                    ;;
                *)
                    echo -n "^bg()^fg()"
                    ;;
            esac
            echo -n "^ca(1,herbstclient focus_monitor $monitor && "'herbstclient use "'${i:1}'") '"${i:1} ^ca()"
            echo -n "$separator"
        done
        echo -n "^bg()^p(_CENTER)"
        # small adjustments
        battery=$(expr $(expr $(cat /sys/class/power_supply/BAT*/charge_now) \* 100) / $(cat /sys/class/power_supply/BAT*/charge_full))
        mpd=$(pidof mpd)
        right="$separator^bg($hintcolor) ^fg(#ffffff)"

        if [ "$mpd" != "" ] ;then
                    right="$right $song $separator ^fg(#ffffff)"
        fi

        if [ "$battery" != "/" ] ;then
                    right="$right $battery% $separator ^fg(#ffffff)"
        fi

        right="$right $date $separator"

        right_text_only=$(echo -n "$right"|sed 's.\^[^(]*([^)]*)..g')
        # get width of right aligned text.. and add some space..
        width=$(textwidth "$font" "$right_text_only  ")
        echo -n "^p(_RIGHT)^p(-$width)$right"
        echo
        # wait for next event
        read line || break
        cmd=( $line )
        # find out event origin
        case "${cmd[0]}" in
            tag*)
                #echo "reseting tags" >&2
                TAGS=( $(herbstclient tag_status $monitor) )
                ;;
            date)
                #echo "reseting date" >&2
                date="${cmd[@]:1}"
                ;;
            quit_panel)
                exit
                ;;
            reload)
                exit
                ;;
            player)
                song=$(mpc current)
                ;;
        esac
    done
} 2> /dev/null | dzen2 -w $width -x $x -y $y -fn "$font" -h $height \
    -ta l -bg "$bgcolor" -fg '#efefef'