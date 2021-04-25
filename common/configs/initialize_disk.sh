#!/bin/sh

if [ -e /dev/block/mmcblk0p4 ]; then
  exit 0
fi

# Create partitions
echo "n
p
92353

w
p
" | fdisk /dev/block/mmcblk0

# Re-read partitions
blockdev --rereadpt /dev/block/mmcblk0

# Force to format partition
for i in 1 2 3 4 5 6 7 8 9 10; do
  if [ -e /dev/block/mmcblk0p4 ]; then
    dd if=/dev/zero of=/dev/block/mmcblk0p4 bs=1048576 count=1
    break
  fi
  sleep 1s
done
