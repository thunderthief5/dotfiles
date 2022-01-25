#!/usr/bin/env bash

### {{{ Modules

# Volume
volume (){
if command -v amixer 2>&1 >/dev/null; then
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4"|"$2 }' | sed 's/on://g'`
    echo -e "$vol"
elif command -v pamixer 2>&1 >/dev/null; then
    if [ "$(pamixer --get-mute)" = "true" ]; then
        echo 'M'
    else
        echo $(pamixer --get-volume)
    fi
fi
}

# Capslock
capslock() {
  if [ "$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')" = "on" ]; then
      echo "CAPS"
    fi
}

# Screen Brightness
brightness_value() {
  cat /sys/class/backlight/intel_backlight/brightness
}
brightness() {
  expr $(brightness_value) / 44
}

# WiFi
network() {
wifi="$(ip a | grep wlan0 | grep inet | wc -l)"
## wire="$(ip a | grep eth0 | grep inet | wc -l)"
## wifi="$(ip a | grep wlan | grep inet | wc -l)"
wire="$(ip a | grep enp1s0 | grep inet | wc -l)"
if [ $wire = 1 ]; then
    echo "UP "
elif [ $wifi = 1 ]; then
    echo "UP"
else
    echo "DOWN"
fi
}

# Battery
bat_per0() {
    cat /sys/class/power_supply/BAT0/capacity
}
bat_stat0() {
    cat /sys/class/power_supply/BAT0/status
}
bat_icon0() {
    case "$(bat_stat)" in
        'Charging') echo ''
        ;;
        'Not Charging') echo ''
        ;;
        'Discharging')
            case "$(bat_per0)" in
                '100') echo ''
                ;;
                '9'*) echo ''
                ;;
                '8'*) echo ''
                ;;
                '7'*) echo ''
                ;;
                '6'*) echo ''
                ;;
                '5'*) echo ''
                ;;
                '4'*) echo ''
                ;;
                '3'*) echo ''
                ;;
                '2'*) echo ''
                ;;
                '1'*) echo ''
                ;;
                '0'*) echo ''
                ;;
                *) echo ''
                ;;

            esac
        ;;
        *) echo ''
        ;;
    esac

}

bat_per1() {
    cat /sys/class/power_supply/BAT1/capacity
}
bat_stat1() {
    cat /sys/class/power_supply/BAT1/status
}
bat_icon1() {
    case "$(bat_stat)" in
        'Charging') echo ''
        ;;
        'Not Charging') echo ''
        ;;
        'Discharging')
            case "$(bat_per1)" in
                '100') echo ''
                ;;
                '9'*) echo ''
                ;;
                '8'*) echo ''
                ;;
                '7'*) echo ''
                ;;
                '6'*) echo ''
                ;;
                '5'*) echo ''
                ;;
                '4'*) echo ''
                ;;
                '3'*) echo ''
                ;;
                '2'*) echo ''
                ;;
                '1'*) echo ''
                ;;
                '0'*) echo ''
                ;;
                *) echo ''
                ;;
            esac
        ;;
        *) echo ''
        ;;
    esac

}

# RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

# CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%"
}

### }}}

status(){
	echo " $(capslock) [RAM:$(mem)] [BAT:$(bat_per0)|$(bat_per1)] [VOL:$(volume)] [BRI:$(brightness)] [WIFI:$(network)] [$(date +'%H:%M')]"
}


while true; do
	xsetroot -name "$(status)"
	sleep 5
done
