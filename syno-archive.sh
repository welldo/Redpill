#!/usr/bin/env bash

# Used: mkdir CodecPack; ./synoarchive -vxf CodecPack.spk -C CodecPack
# Used: ./tar -vcf CodecPack_new.spk -C CodecPack .

ROOT_PATH=$PWD
TOOL_PATH="$(dirname $(readlink -f "$0"))/syno-archive"

GITHUB_URL="https://raw.githubusercontent.com/wjz304/rpcb/main/syno-archive"
#GITHUB_URL="https://fastly.jsdelivr.net/gh/wjz304/rpcb@main/syno-archive"
[ ! -d "${TOOL_PATH}" ] && mkdir -p "${TOOL_PATH}"
for f in libboost_filesystem.so.1.68.0 libboost_system.so.1.68.0 libcrypto.so.1.1 libicudata.so.64 libicui18n.so.64 libicuio.so.64.2 libicuuc.so.64.2 libjson.so libmsgpackc.so.2 libsodium.so libsynocodesign.so.7 libsynocore.so.7 libsynocredentials.so.7 libsynocrypto.so.7 synoarchive; do
  [ ! -e "${TOOL_PATH}/${f}" ] && curl -skL "${GITHUB_URL}/${f}" -o "${TOOL_PATH}/${f}"
done
sudo chmod -R +x "${TOOL_PATH}"
sudo LD_LIBRARY_PATH="${TOOL_PATH}" "${TOOL_PATH}/synoarchive" $@



# GET
#
#!/usr/bin/env bash

#TOOL_PATH="$(dirname $(readlink -f "$0"))/syno-archive"
#
#sos=()
#sos[${#sos[@]}]="libboost_filesystem.so.1.68.0 libboost_filesystem.so.1.68.0"
#sos[${#sos[@]}]="libboost_system.so.1.68.0 libboost_system.so.1.68.0"
#sos[${#sos[@]}]="libcrypto.so.1.1 libcrypto.so.1.1"
#sos[${#sos[@]}]="libicudata.so.64.2 libicudata.so.64"
#sos[${#sos[@]}]="libicui18n.so.64.2 libicui18n.so.64"
#sos[${#sos[@]}]="libicuio.so.64.2 libicuio.so.64.2"
#sos[${#sos[@]}]="libicuuc.so.64.2 libicuuc.so.64.2"
#sos[${#sos[@]}]="libjson.so.1 libjson.so"
#sos[${#sos[@]}]="libmsgpackc.so.2.0.0 libmsgpackc.so.2"
#sos[${#sos[@]}]="libsodium.so libsodium.so"
#sos[${#sos[@]}]="libsynocodesign.so.7 libsynocodesign.so.7"
#sos[${#sos[@]}]="libsynocore.so.7 libsynocore.so.7"
#sos[${#sos[@]}]="libsynocredentials.so.7 libsynocredentials.so.7"
#sos[${#sos[@]}]="libsynocrypto.so.7 libsynocrypto.so.7"
#sos[${#sos[@]}]="synoarchive synoarchive"
#
#for f in ${sos[@]}; do
#  cp -fv "/usr/lib/${f[0]}" "${TOOL_PATH}/${f[1]}"
#done

