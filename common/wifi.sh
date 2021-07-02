#!/system/bin/sh

# From 351ELEC

# Enable WIFI GPIO for WIFI manipulation
echo 5 > /sys/class/gpio/export

# Power up the WIFI device
echo out > /sys/class/gpio/gpio5/direction
echo 1 >  /sys/class/gpio/gpio5/value

