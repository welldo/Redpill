
filename=${1}
filename=${filename##*\/}
filename=${filename%%\?*}

curl -#kO "$1"

header="$(od -bcN2 ${filename} | head -1 | awk '{print $3}')"
case ${header} in
  105)
    echo "Uncompressed tar"
    isencrypted="no"
    ;;
  213)
    echo "Compressed tar"
    isencrypted="no"
    ;;
  255)
    echo "Encrypted"
    isencrypted="yes"
    ;;
  *)
    echo "error"
    return 1
    ;;
esac
if [ "${isencrypted}" = "yes" ]; then
  curl -skL https://raw.githubusercontent.com/wjz304/Redpill_CustomBuild/main/syno-extractor.sh | sudo bash -s "${filename}" "${filename%%\.*}"
else
  mkdir -p "${filename%%\.*}"
  tar -xf "${filename}" -C "${filename%%\.*}" >/dev/null 2>&1
fi
md5sum "${filename}"
sha256sum "${filename}"
sha256sum "${filename%%\.*}/rd.gz"
sha256sum "${filename%%\.*}/zImage"

