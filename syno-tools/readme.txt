curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/libpci.so.3 -o libpci.so.3 
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/libz.so.1 -o libz.so.1
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/libudev.so.1 -o libudev.so.1
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/lspci -o lspci && chmod +x lspci
export LD_LIBRARY_PATH=$PWD; $PWD/lspci -nnqk


curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/lsscsi -o lsscsi && chmod +x lsscsi
export LD_LIBRARY_PATH=$PWD; $PWD/lsscsi -itds


curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/libz.so.1 -o libz.so.1
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/libudev.so.1 -o libudev.so.1
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/libusb-1.0.so.0 -o libusb-1.0.so.0
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/usb.ids -o usb.ids
mkdir /var/lib/usbutils; cp -v usb.ids /var/lib/usbutils/usb.ids; chmod 644 /var/lib/usbutils/usb.ids
curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/lsusb -o lsusb && chmod +x lsusb
export LD_LIBRARY_PATH=$PWD; $PWD/lsusb -t


curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/dmidecode -o dmidecode && chmod +x dmidecode
export LD_LIBRARY_PATH=$PWD; $PWD/dmidecode


curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/ethtool -o ethtool && chmod +x ethtool 
export LD_LIBRARY_PATH=$PWD; for netdev in `ifconfig |grep -i eth | cut -c 1-4`; do $PWD/ethtool -i ${netdev}; done


curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/dtc -o dtc && chmod +x dtc
./dtc -I dtb -O dts /etc.defaults/model.dtb > output.dts
./dtc -I dts -O dtb output.dts > /etc.defaults/model.dtb
curl -fsSL --insecure -w '\n' --upload-file output.dtb https://transfer.sh


curl -skL https://github.com/wjz304/Redpill_CustomBuild/raw/main/syno-tools/dtbpatch -o dtbpatch && chmod +x dtbpatch
./dtbpatch /etc.defaults/model.dtb output.dtb


curl -skL https://www.busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox -o busybox && chmod +x busybox
_moddir="/lib/modules/`/bin/uname -r`"; [ ! -d "${_moddir}" ] && mkdir -p "${_moddir}" && ./busybox depmod
./busybox depmod
./busybox modinfo /lib/modules/kvm-intel.ko