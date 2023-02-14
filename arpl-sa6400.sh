#!/usr/bin/env bash

ROOT_PATH=$PWD
TEMP_PATH=/tmp
RDXZ_PATH=${TEMP_PATH}/rdxz_tmp

echo Opening..
if [ -f "/opt/arpl/model-configs/SA6400.yml" ]; then
  echo "SA6400 is exist!"
  exit 0
fi

sed -i 's/global.download.synology.com/cndl.synology.cn/g' /opt/arpl/menu.sh
sed -i 's/global.download.synology.com/cndl.synology.cn/g' `find /opt/arpl/model-configs/ -type f`
[ -z "$(grep "inetd" /opt/arpl/ramdisk-patch.sh)" ] && sed -i '/# Build modules dependencies/i\# Enable Telnet\necho "inetd" >> "${RAMDISK_PATH}/addons/addons.sh"\n' /opt/arpl/ramdisk-patch.sh

[ -f "/opt/arpl/model-configs/SA6400.yml.disabled" ] && rm -f "/opt/arpl/model-configs/SA6400.yml.disabled"

curl -skL "https://github.com/wjz304/Redpill_CustomBuild/files/10736435/SA6400.yml.gz" -o "/opt/arpl/model-configs/SA6400.yml.gz"
gzip -d "/opt/arpl/model-configs/SA6400.yml.gz"


if [ ! -f "/opt/arpl/patch/ramdisk-common-init-script-v5.patch" ]; then
  curl -skL "https://github.com/wjz304/Redpill_CustomBuild/files/10736439/ramdisk-sa6400-init-script.patch.gz" -o "/opt/arpl/patch/ramdisk-sa6400-init-script.patch.gz"
  gzip -d "/opt/arpl/patch/ramdisk-sa6400-init-script.patch.gz"
fi

mkdir -p "${RDXZ_PATH}"
(cd "${RDXZ_PATH}"; xz -dc < "/mnt/p3/initrd-arpl" | cpio -idm) >/dev/null 2>&1 || true
rm -rf ${RDXZ_PATH}/opt/arpl
cp -rf "/opt/arpl" "${RDXZ_PATH}/opt"
(cd "${RDXZ_PATH}"; find . 2>/dev/null | cpio -o -H newc -R root:root | xz --check=crc32 > "/mnt/p3/initrd-arpl") || true
rm -rf "${RDXZ_PATH}"

TAG=`curl -skL https://api.github.com/repos/fbelavenuto/arpl-modules/releases/latest | grep "tag_name" | awk '{print substr($2, 2, length($2)-3)}'`
[ ! -f "/mnt/p3/modules/epyc7002-5.10.55.tgz" ] && curl -skL "https://github.com/fbelavenuto/arpl-modules/releases/download/${TAG}/epyc7002-5.10.55.tgz" -o "/mnt/p3/modules/epyc7002-5.10.55.tgz"
#jim
[ ! -f "/mnt/p3/lkms/rp-epyc7002-5.10.55-dev.ko.gz" ] && curl -skL "https://github.com/wjz304/Redpill_CustomBuild/files/10734771/rp-epyc7002-5.10.55-dev.ko.gz" -o "/mnt/p3/lkms/rp-epyc7002-5.10.55-dev.ko.gz"
[ ! -f "/mnt/p3/lkms/rp-epyc7002-5.10.55-prod.ko.gz" ] && curl -skL "https://github.com/wjz304/Redpill_CustomBuild/files/10734770/rp-epyc7002-5.10.55-prod.ko.gz" -o "/mnt/p3/lkms/rp-epyc7002-5.10.55-prod.ko.gz"

echo "Open SA6400 OK!"
