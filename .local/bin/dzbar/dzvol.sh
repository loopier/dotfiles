 #!/bin/sh

FG='#aaaaaa'
BG='#1a1a1a'

# VOL=$(amixer get Master | awk '/%/ {print $0}' | sed -r 's/.*\[(.+%)\].*/\1/')
VOL=$(amixer get Master | awk '/%/ {print $0}' | sed -r 's/.*\[(.+)%\].*/\1/')

if [[ $VOL -ge 90 ]]; then
    BG='#dd6666'
    FG='#000000'
elif [[ $VOL -ge 70 && $VOL -lt 90 ]]; then
    BG='#aaaa66'
    FG='#000000'
elif [[ $VOL -lt 70 ]]; then
    BG='#666666'
    FG='#000000'
elif [[ $VOL -le 0 ]]; then
    BG='#000000'
    FG='#aaaaaa'
fi

echo "^bg($BG)^fg($FG) $VOL% ^fg()^bg()"
