#!/usr/bin/env bash

REPO=${1}
BRANCH=${2}
WORK_PATH=${3-.}

echo REPO:${REPO}    BRANCH:${BRANCH}    WORK_PATH:${WORK_PATH}

# load 容错
sed -i 's|          exit 1|          break|' ${WORK_PATH}/include/loader-ext/target_exec.sh_
sed -i 's/printf "${2}" "${@:3}"/printf "${2}\\n" "${@:3}"/' ${WORK_PATH}/include/log.sh
sed -i 's/\[ $(tput colors || exit 1) -gt 0 ]/[[ $([[ -n "$TERM" ]] \&\& tput colors || exit 1) -gt 0 ]]/' ${WORK_PATH}/include/log.sh

sed -i '/BRP_DEBUG=/a\BRP_PLATFORM_KERNELVERSION=${BRP_PLATFORM_KERNELVERSION:-"XXXXXXXX"} # platform + kernel version' ${WORK_PATH}/build-loader.sh

sed -i 's/rpt_load_bundled_extensions/[ -e "${RPT_BUNDLED_EXTS_CFG}" ] \&\& rpt_load_bundled_extensions/' ${WORK_PATH}/build-loader.sh
[ -e ${WORK_PATH}/bundled-exts.json ] && rm -f ${WORK_PATH}/bundled-exts.json

sed -i 's/mrp_validate_platform_id()/mrp_validate_platform_id_bak()/'                                                                                                                         ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_validate_platform_id_bak()/i\mrp_validate_platform_id()'                                                                                                                         ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_validate_platform_id_bak()/i\{'                                                                                                                                                  ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_validate_platform_id_bak()/i\  return 0'                                                                                                                                         ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_validate_platform_id_bak()/i\}'                                                                                                                                                  ${WORK_PATH}/ext-manager.sh

sed -i 's/mrp_fetch_new_ext_recipe()/mrp_fetch_new_ext_recipe_bak()/'                                                                                                                         ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\mrp_fetch_new_ext_recipe()'                                                                                                                         ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\{'                                                                                                                                                  ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  pr_dbg "Fetching new recipe for extension %s and platform %s" "${1}" "${2}"'                                                                      ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\'                                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  if ! mrp_validate_platform_id "${2}"; then '                                                                                                      ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    pr_err "Platform ID %s is not valid" "${2}"'                                                                                                    ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    return 1'                                                                                                                                       ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  fi'                                                                                                                                               ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\'                                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  local index_file;'                                                                                                                                ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  index_file=$(mrp_get_existing_index_file "${1}")'                                                                                                 ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  if [ $? -ne 0 ]; then'                                                                                                                            ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    pr_err "Failed to load index file for extension %s - see errors above for details" "${1}"'                                                      ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    return 1'                                                                                                                                       ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  fi'                                                                                                                                               ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\'                                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  local recipe_url;'                                                                                                                                ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  recipe_url=$(brp_json_get_field "${index_file}" "releases.\\\"${2}\\\"" 1)'                                                                       ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  if [[ $? -ne 0 ]] || [[ "${recipe_url}" == "null" ]]; then'                                                                                       ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    pr_warn "Failed to get recipe for %s try fallback to \"${BRP_PLATFORM_KERNELVERSION}\"" "${2}"'                                                 ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    recipe_url=$(brp_json_get_field "${index_file}" "releases.\\\"${BRP_PLATFORM_KERNELVERSION}\\\"" 1)'                                            ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    if [[ $? -ne 0 ]] || [[ "${recipe_url}" == "null" ]]; then'                                                                                     ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\      pr_warn "Failed to get recipe for %s try fallback to \"_\"" "${2}"'                                                                           ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\      recipe_url=$(brp_json_get_field "${index_file}" "releases.\\\"_\\\"" 1)'                                                                      ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\      if [[ $? -ne 0 ]] || [[ "${recipe_url}" == "null" ]]; then'                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\        pr_err "The extension %s was found. However, the extension index has no recipe for %s platform. It may not be" "${1}" "${2}"'               ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\        pr_err "supported on that platform, or author did not updated it for that platform yet. You can try running"'                               ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\        pr_err "\"%s update\" to refresh indexes for all extensions manually. Below are the currently known information about" "${MRP_SRC_NAME}"'   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\        pr_err "the extension stored locally:"'                                                                                                     ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\        mrp_show_ext_info "${1}"'                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\        return 1'                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\      fi'                                                                                                                                           ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\    fi'                                                                                                                                             ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  fi'                                                                                                                                               ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\'                                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  local mrp_tmp_rcp="${RPT_EXTS_DIR}/_ext_new_rcp.tmp_json"'                                                                                        ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  rm "${mrp_tmp_rcp}" &> /dev/null'                                                                                                                 ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\'                                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  rpt_download_remote "${recipe_url}" "${mrp_tmp_rcp}" 1'                                                                                           ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  brp_json_validate "${mrp_tmp_rcp}" # validate JSON *file*, not its format/semantic'                                                               ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\'                                                                                                                                                   ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\  echo "${mrp_tmp_rcp}"'                                                                                                                            ${WORK_PATH}/ext-manager.sh
sed -i '/mrp_fetch_new_ext_recipe_bak()/i\}'                                                                                                                                                  ${WORK_PATH}/ext-manager.sh


# resize boot
#[ -f boot-image-template.img.gz ] && cp -f boot-image-template.img.gz ${WORK_PATH}/ext/boot-image-template.img.gz


# 三方库容错
if [ "${REPO}" == "pocopico" -a "${BRANCH}" == "develop" ]; then 
  #cd ${WORK_PATH} && git reset --hard d810a64a33fdc84287ab68e2d5919763c725ebeb && cd ..

  #find ${WORK_PATH}/config/DS3622xs+ -type d -name '*3622xs*' -execdir rename 's/3622xs\+/3622xsp/' '{}' +
  find ${WORK_PATH}/config/DS3622xs+ -type f -name '*3622xs*' -exec rename 's/-3622xs\+/-3622xsp/' '{}' +
  sed -i 's/DS3622xs /DS3622xs+ /g; s/-3622xs+/-3622xsp/g' `find ${WORK_PATH}/config/DS3622xs+ -type f -name '*config.json'`

  # 容错
  [ -e ${WORK_PATH}/config/DS1520+/7.1.1-42962/config.json ] && sed -i 's/DSM_ds1520p_42962.pat/DSM_DS1520%2B_42962.pat/g' ${WORK_PATH}/config/DS1520+/7.1.1-42962/config.json
  [ -e ${WORK_PATH}/redpill-misc/recipes/universal.json ] && sed -i 's/856331415d6980d9ef03a75eae4b9c5c927d1083266e1d7038ad8c62fbc2d570/625daf8507141d055b60b9e5ffd633cde1302d68387d611ac97a98a92f820501/g' ${WORK_PATH}/redpill-misc/recipes/universal.json

  [ -e ${WORK_PATH}/config/DS1019+/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/DS1019+/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DS1019+/7.0.1-42218/config.json -o ${WORK_PATH}/config/DS1019+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/DS1520+/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/DS1520+/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DS1520+/7.0.1-42218/config.json -o ${WORK_PATH}/config/DS1520+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/DS1520+/7.1.0-42661/config.json ] && rm -rf ${WORK_PATH}/config/DS1520+/7.1.0-42661/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DS1520+/7.1.0-42661/config.json -o ${WORK_PATH}/config/DS1520+/7.1.0-42661/config.json
  [ -e ${WORK_PATH}/config/DS1621xs+/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/DS1621xs+/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DS1621xs+/7.0.1-42218/config.json -o ${WORK_PATH}/config/DS1621xs+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/DVA3219/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/DVA3219/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DVA3219/7.0.1-42218/config.json -o ${WORK_PATH}/config/DVA3219/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/DVA3219/7.1.0-42661/config.json ] && rm -rf ${WORK_PATH}/config/DVA3219/7.1.0-42661/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DVA3219/7.1.0-42661/config.json -o ${WORK_PATH}/config/DVA3219/7.1.0-42661/config.json
  [ -e ${WORK_PATH}/config/DVA3221/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/DVA3221/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DVA3221/7.0.1-42218/config.json -o ${WORK_PATH}/config/DVA3221/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/DVA3221/7.1.0-42661/config.json ] && rm -rf ${WORK_PATH}/config/DVA3221/7.1.0-42661/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/DVA3221/7.1.0-42661/config.json -o ${WORK_PATH}/config/DVA3221/7.1.0-42661/config.json
  [ -e ${WORK_PATH}/config/FS2500/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/FS2500/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/FS2500/7.0.1-42218/config.json -o ${WORK_PATH}/config/FS2500/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/FS2500/7.1.0-42661/config.json ] && rm -rf ${WORK_PATH}/config/FS2500/7.1.0-42661/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/FS2500/7.1.0-42661/config.json -o ${WORK_PATH}/config/FS2500/7.1.0-42661/config.json
  [ -e ${WORK_PATH}/config/FS6400/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/FS6400/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/FS6400/7.0.1-42218/config.json -o ${WORK_PATH}/config/FS6400/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/RS3413xs+/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/RS3413xs+/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/RS3413xs+/7.0.1-42218/config.json -o ${WORK_PATH}/config/RS3413xs+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/RS3413xs+/7.1.0-42661/config.json ] && rm -rf ${WORK_PATH}/config/RS3413xs+/7.1.0-42661/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/RS3413xs+/7.1.0-42661/config.json -o ${WORK_PATH}/config/RS3413xs+/7.1.0-42661/config.json
  [ -e ${WORK_PATH}/config/RS3618xs/7.0.1-42218/config.json ] && rm -rf ${WORK_PATH}/config/RS3618xs/7.0.1-42218/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/RS3618xs/7.0.1-42218/config.json -o ${WORK_PATH}/config/RS3618xs/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/RS3618xs/7.1.0-42661/config.json ] && rm -rf ${WORK_PATH}/config/RS3618xs/7.1.0-42661/config.json && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/RS3618xs/7.1.0-42661/config.json -o ${WORK_PATH}/config/RS3618xs/7.1.0-42661/config.json

  [ -d ${WORK_PATH}/config/SA6400/7.1.1-42962 -a ! -f ${WORK_PATH}/config/SA6400/7.1.1-42962/zImage-001-SA6400-42962-ramdisk-and-header.bsp ] && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/SA6400/7.1.1-42962/zImage-001-SA6400-42962-ramdisk-and-header.bsp -o ${WORK_PATH}/config/SA6400/7.1.1-42962/zImage-001-SA6400-42962-ramdisk-and-header.bsp
  [ -d ${WORK_PATH}/config/_common/v7.1.1 -a ! -f ${WORK_PATH}/config/_common/v7.1.1/ramdisk-002-init-script-sa6400.patch ] && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/_common/v7.1.1/ramdisk-002-init-script-sa6400.patch -o ${WORK_PATH}/config/_common/v7.1.1/ramdisk-002-init-script-sa6400.patch
  [ -e ${WORK_PATH}/config/SA6400/7.1.1-42962/config.json ] && curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-dev/config/SA6400/7.1.1-42962/config.json -o ${WORK_PATH}/config/SA6400/7.1.1-42962/config.json
fi

if [ "${REPO}" == "PeterSuh-Q3" -a "${BRANCH}" == "master" ]; then 
  # 容错
  [ -e ${WORK_PATH}/config/DS1520+/7.1.1-42962/config.json ] && sed -i 's/DSM_ds1520p_42962.pat/DSM_DS1520%2B_42962.pat/g' ${WORK_PATH}/config/DS1520+/7.1.1-42962/config.json
fi

if [ "${REPO}" == "pocopico" -a "${BRANCH}" == "jun" ]; then 
  # 容错
  [ -e ${WORK_PATH}/config/DVA3221/7.0.1-42218/config.json ] && sed -i 's/cndl.synology.cn/global.download.synology.com/g' ${WORK_PATH}/config/DVA3221/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/FS6400/7.0.1-42218/config.json  ] && sed -i 's/global.synology.com/global.download.synology.com/g' ${WORK_PATH}/config/FS6400/7.0.1-42218/config.json 
  [ -e ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json ] && sed -i 's/global.synology.com/global.download.synology.com/g' ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json ] && sed -i 's/a72076b1a5c148e775e9542916e2f07fe18d8676dc7396ed69355a9a0a38b36c/7afca3970ac7324d7431c1484d4249939bedd4c18ac34187f894c43119edf3a1/g' ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json ] && sed -i 's/17607e1739c8acc9903272ebd981bccb27b51057cdcb3cc446e5c5149db452d3/b4cc62e9953f226960de98b65887e17dd6df5fa0ad28f665e0b4660dbd5f2fa8/g' ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json
  [ -e ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json ] && sed -i 's/3aa9d810064747fca6d0a3ab4c979bd82b49fc0d166dfe714261c2a22145cc70/3510afe5b3dfe3662bfe054c1728c8794911da431718b533cd03d2a2c061ffd5/g' ${WORK_PATH}/config/RS4021xs+/7.0.1-42218/config.json
fi

if [ "${REPO}" == "jumkey" -a "${BRANCH}" == "develop" ]; then 
  # 容错
  if [ -d ${WORK_PATH}/config/DS920+/7.0.1-42218 ]; then
    rm -rf ${WORK_PATH}/config/DS920+/7.0.1-42218/*
    curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-jun/config/DS920+/7.0.1-42218/zImage-001-920p-42218-ramdisk-and-flag-NOP.bsp -o ${WORK_PATH}/config/DS920+/7.0.1-42218/zImage-001-920p-42218-ramdisk-and-flag-NOP.bsp
    curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-jun/config/DS920+/7.0.1-42218/config.json -o ${WORK_PATH}/config/DS920+/7.0.1-42218/config.json
  fi
  if [ -d ${WORK_PATH}/config/DVA3221/7.0.1-42218 ]; then
    rm -rf ${WORK_PATH}/config/DVA3221/7.0.1-42218/*
    curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-jun/config/DVA3221/7.0.1-42218/zImage-001-dav3221-42218-ramdisk-and-header.bsp -o ${WORK_PATH}/config/DVA3221/7.0.1-42218/zImage-001-dav3221-42218-ramdisk-and-header.bsp
    curl -sSL https://raw.githubusercontent.com/wjz304/redpill-load/test-jun/config/DVA3221/7.0.1-42218/config.json -o ${WORK_PATH}/config/DVA3221/7.0.1-42218/config.json
  fi
  [ -e ${WORK_PATH}/config/DS923+/7.1.1-42962/config.json ] && sed -i 's|file://localhost/root/DSM_DS923%2B_42962.pat|https://global.download.synology.com/download/DSM/release/7.1.1/42962/DSM_DS923%2B_42962.pat|g' ${WORK_PATH}/config/DS923+/7.1.1-42962/config.json
  [ -e ${WORK_PATH}/config/DS923+/7.1.1-42962/config.json ] && sed -i 's|a2bcfae34eda13f65bc7ee453b63bab982e2db9891a680968bc24ef5035ae8d8|e33b47df446ce0bd99c5613767c9dba977915e25acfb5ccb9f5650b14459458f|g' ${WORK_PATH}/config/DS923+/7.1.1-42962/config.json
  rm -rf ${WORK_PATH}/config/DVA1622
  #[ -d ${WORK_PATH}/config/DVA1622/7.1-42661 ] && mv ${WORK_PATH}/config/DVA1622/7.1-42661 ${WORK_PATH}/config/DVA1622/7.1.0-42661
  #[ -e ${WORK_PATH}/config/DVA1622/7.1.0-42661/config.json ] && sed -i 's|file://localhost/root/content.tar|https://global.download.synology.com/download/DSM/release/7.1/42661-1/DSM_DVA1622_42661.pat|g' ${WORK_PATH}/config/DVA1622/7.1-42661/config.json
  #[ -e ${WORK_PATH}/config/DVA1622/7.1.0-42661/config.json ] && sed -i 's|99f60f0c2b54c0a2adbc01d79e872273488ba43296a7a74904c462bc423b7dfe|f1484cf302627072ca393293cd73e61dc9e09d479ef028b216eae7c12f7b7825|g' ${WORK_PATH}/config/DVA1622/7.1-42661/config.json
  #[ -e ${WORK_PATH}/config/DVA1622/7.1.0-42661/config.json ] && sed -i 's|a31e91a62ab6f3ff986bc7fcfde0a56a292c15e17735e7b5fad573d333cf7de4|1d0e5b76e08e3483f6bf06d23b5978ec498b855bde23db1f96f343db4c43337d|g' ${WORK_PATH}/config/DVA1622/7.1-42661/config.json
  #[ -e ${WORK_PATH}/config/DVA1622/7.1.0-42661/config.json ] && sed -i 's|32ee25e7a806eb481cc858edd7f1e341c85c7627ea03788f8466716432830d33|6290945ba61f652aec83725f81f5a47bd5e4cdbeb86241c33825154140e164ec|g' ${WORK_PATH}/config/DVA1622/7.1-42661/config.json
fi

exit 0