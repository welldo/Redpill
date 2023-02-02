#!/usr/bin/env bash

ROOT_PATH=$PWD
TOOL_PATH=`dirname $0`
# GITHUB_URL="https://raw.githubusercontent.com/wjz304/Redpill_CustomBuild/main/syno-extractor"
GITHUB_URL="https://fastly.jsdelivr.net/gh/wjz304/Redpill_CustomBuild@main/syno-extractor"
[ ! -d "${TOOL_PATH}/syno-extractor" ] && mkdir -p "${TOOL_PATH}/syno-extractor"
for f in libcurl.so.4 libmbedcrypto.so.5 libmbedtls.so.13 libmbedx509.so.1 libmsgpackc.so.2 libsodium.so libsynocodesign-ng-virtual-junior-wins.so.7 syno_extract_system_patch; do
  [ ! -e "${TOOL_PATH}/syno-extractor/${f}" ] && curl -L "${GITHUB_URL}/${f}" -o "${TOOL_PATH}/syno-extractor/${f}"
done

sudo LD_LIBRARY_PATH="${TOOL_PATH}/syno-extractor" "${TOOL_PATH}/syno-extractor/syno_extract_system_patch" $@
