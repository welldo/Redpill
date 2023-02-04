#!/usr/bin/env bash

ROOT_PATH=$PWD

echo Opening..

RDXZ_PATH=${ROOT_PATH}/rdxz_tmp
mkdir -p "${RDXZ_PATH}"; (cd "${RDXZ_PATH}"; xz -dc < "/mnt/p3/initrd-arpl" | cpio -idm) >/dev/null 2>&1 || true
if [ -f "${RDXZ_PATH}/opt/arpl/model-configs/SA6400.yml.disabled" ]; then
  cd "${RDXZ_PATH}"
  mv "opt/arpl/model-configs/SA6400.yml.disabled" "opt/arpl/model-configs/SA6400.yml"
  find . 2>/dev/null | cpio -o -H newc -R root:root | xz --check=crc32 > "/mnt/p3/initrd-arpl"
  cd "${ROOT_PATH}"
  mv "/opt/arpl/model-configs/SA6400.yml.disabled" "/opt/arpl/model-configs/SA6400.yml"
fi
rm -rf "${RDXZ_PATH}"

[ ! -f "/mnt/p3/modules/epyc7002-5.10.55.tgz" ] && curl -skL "https://github.com/fbelavenuto/arpl-modules/releases/download/v1.63/epyc7002-5.10.55.tgz" -o "/mnt/p3/modules/epyc7002-5.10.55.tgz"
[ ! -f "/mnt/p3/lkms/rp-epyc7002-5.10.55-dev.ko.gz" ] && curl -skL "https://github.com/wjz304/Redpill_CustomBuild/files/10607931/rp-epyc7002-5.10.55-dev.ko.gz" -o "/mnt/p3/lkms/rp-epyc7002-5.10.55-dev.ko.gz"
[ ! -f "/mnt/p3/lkms/rp-epyc7002-5.10.55-prod.ko.gz" ] && curl -skL "https://github.com/wjz304/Redpill_CustomBuild/files/10607932/rp-epyc7002-5.10.55-prod.ko.gz" -o "/mnt/p3/lkms/rp-epyc7002-5.10.55-prod.ko.gz"

echo "Open SA6400 OK!"
