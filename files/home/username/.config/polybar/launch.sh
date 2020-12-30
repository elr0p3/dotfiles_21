# !/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 5; done

# Launch bar1 and bar2
# polybar example &
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 >>/tmp/polybar1.log 2>&1 &
# polybar bar2 >>/tmp/polybar2.log 2>&1 &
polybar r0p3-bar-HDMI -r &
polybar r0p3-bar-DP -r &

echo "Polybar launched..."
