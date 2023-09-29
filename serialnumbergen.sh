#!/bin/bash

function beginArray() {
  case $1 in
  DS224+)
    serialstart="2350"
    permanent="WBR"
    suffix="alpha"
    ;;
  DS423+)
    serialstart="22A0"
    permanent="VKR"
    suffix="alpha"
    ;;
  DS718+)
    serialstart="1930"
    permanent="PEN"
    suffix="numeric"
    ;;
  DS720+)
    serialstart="2010 2110"
    permanent="QWR"
    suffix="alpha"
    ;;
  DS723+)
    serialstart="2270"
    permanent="TQR"
    suffix="alpha"
    ;;
  DS916+)
    serialstart="1130 1230 1330 1430"
    permanent="NZN"
    suffix="numeric"
    ;;
  DS918+)
    serialstart="1910"
    permanent="PDN"
    suffix="numeric"
    ;;
  DS920+)
    serialstart="2030 2040 20C0 2150"
    permanent="SBR"
    suffix="alpha"
    ;;
  DS923+)
    serialstart="2270"
    permanent="TQR"
    suffix="alpha"
    ;;
  DS1019+)
    serialstart="1850"
    permanent="QXR"
    suffix="numeric"
    ;;
  DS1520+)
    serialstart="2060"
    permanent="RYR"
    suffix="alpha"
    ;;
  DS1522+)
    serialstart="2270"
    permanent="TRR"
    suffix="alpha"
    ;;
  DS1621+)
    serialstart="2080"
    permanent="S7R"
    suffix="alpha"
    ;;
  DS1621xs+)
    serialstart="2070"
    permanent="RVR"
    suffix="alpha"
    ;;
  DS1819+)
    serialstart="1890"
    permanent="R5R"
    suffix="alpha"
    ;;
  DS1821+)
    serialstart="2110"
    permanent="SKR"
    suffix="alpha"
    ;;
  DS1823xs+)
    serialstart="2280"
    permanent="V5R"
    suffix="alpha"
    ;;
  DS2419+)
    serialstart="1880"
    permanent="QZA"
    suffix="alpha"
    ;;
  DS2422+)
    serialstart="2140 2180"
    permanent="SLR"
    suffix="alpha"
    ;;
  DS3615xs)
    serialstart="1130 1230 1330 1430"
    permanent="LWN"
    suffix="numeric"
    ;;
  DS3617xs)
    serialstart="1130 1230 1330 1430"
    permanent="ODN"
    suffix="numeric"
    ;;
  DS3622xs+)
    serialstart="2030 2040 20C0 2150"
    permanent="SQR"
    suffix="alpha"
    ;;
  DVA1622)
    serialstart="2030 2040 20C0 2150"
    permanent="UBR"
    suffix="alpha"
    ;;
  DVA3219)
    serialstart="1930 1940"
    permanent="RFR"
    suffix="alpha"
    ;;
  DVA3221)
    serialstart="2030 2040 20C0 2150"
    permanent="SJR"
    suffix="alpha"
    ;;
  FS2500)
    serialstart="1960"
    permanent="PSN"
    suffix="numeric"
    ;;
  FS3017)
    serialstart="1650"
    permanent="O8N"
    suffix="numeric"
    ;;
  FS6400)
    serialstart="1960"
    permanent="PSN"
    suffix="numeric"
    ;;
  RS1221+)
    serialstart="20B0"
    permanent="RWR"
    suffix="alpha"
    ;;
  RS1619xs+)
    serialstart="1920"
    permanent="QPR"
    suffix="alpha"
    ;;
  RS3413xs+)
    serialstart="0000"
    permanent="XXX"
    suffix="numeric"
    ;;
  RS3618xs)
    serialstart="0000"
    permanent="XXX"
    suffix="numeric"
    ;;
  RS3621xs+)
    serialstart="20A0"
    permanent="SZR"
    suffix="alpha"
    ;;
  RS4021xs+)
    serialstart="2160"
    permanent="T2R"
    suffix="alpha"
    ;;
  SA3200D)
    serialstart="19A0"
    permanent="S4R"
    suffix="alpha"
    ;;
  SA3400)
    serialstart="1920"
    permanent="RJR"
    suffix="alpha"
    ;;
  SA3400D)
    serialstart="0000"
    permanent="XXX"
    suffix="alpha"
    ;;
  SA3410)
    serialstart="0000"
    permanent="XXX"
    suffix="alpha"
    ;;
  SA3600)
    serialstart="0000"
    permanent="XXX"
    suffix="alpha"
    ;;
  SA3610)
    serialstart="0000"
    permanent="XXX"
    suffix="alpha"
    ;;
  SA6400)
    serialstart="2270"
    permanent="UMR"
    suffix="alpha"
    ;;
  *)
    serialstart="0000"
    permanent="XXX"
    suffix="alpha"
    ;;
  esac
}

function random() {
  printf "%06d" $(($RANDOM % 30000 + 1))
}

function randomhex() {
  printf "&02X" "$(($RANDOM % 255 + 1))"
}

function generateRandomLetter() {
  for i in a b c d e f g h j k l m n p q r s t v w x y z; do
    echo $i
  done | sort -R | tail -1
}

function generateRandomValue() {
  for i in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h j k l m n p q r s t v w x y z; do
    echo $i
  done | sort -R | tail -1
}

function toupper() {
  echo $1 | tr '[:lower:]' '[:upper:]'
}

function generateMacAddress() {
  #toupper "Mac Address: 00:11:32:$(randomhex):$(randomhex):$(randomhex)"
  if [ "$1" = "DS923+" ] || [ "$1" = "DS1522+" ] || [ "$1" = "RS4021xs+" ]; then
    # DS1522+ and DS923+ Mac starts with 90:09:d0
    printf '90:09:d0:%02X:%02X:%02X' $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256))
  else
    printf '00:11:32:%02X:%02X:%02X' $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256))
  fi
}

function generateSerial() {
  beginArray $1
  serialnum="$(echo "${serialstart}" | tr ' ' '\n' | sort -R | tail -1)${permanent}"
  case ${suffix} in
  numeric)
    serialnum+=$(random)
    ;;
  alpha)
    serialnum+=$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter)
    ;;
  esac
  echo ${serialnum}
}

function showhelp() {
  cat <<EOF
$(basename ${0})

----------------------------------------------------------------------------------------
Usage: ${0} <model>
e.g. $(basename ${0}) DS3615xs
----------------------------------------------------------------------------------------
EOF
}

if [ -z "$1" ]; then
  showhelp
else
  echo $(generateMacAddress $1)
  echo $(generateSerial $1)
fi
