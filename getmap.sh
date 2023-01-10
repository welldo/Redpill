#!/usr/bin/env ash

SataPortMap=""
DiskIdxMap=""

let allNum=0
controllerNum=`cat /sys/block/sd*/device/syno_disk_serial | cut -c1-1 | sort -u | wc -w`

for item in `cat /sys/block/sd*/device/syno_disk_serial | cut -c1-1 | sort -u`
do
  let idxNum=`cat /sys/block/sd*/device/syno_disk_serial | grep "^${item}" | sort -u | wc -w`
  [ ${idxNum} -gt 9 ] && let idxNum=9
  DiskIdxMap=${DiskIdxMap}`printf "%02x" ${allNum}`
  SataPortMap=${SataPortMap}${idxNum}
  let allNum+=${idxNum}
done

echo DiskIdxMap: ${DiskIdxMap}
echo SataPortMap: ${SataPortMap}
