#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)

if [ "$EUID" -ne 0 ]; then
  # rootユーザーにしか実行させない
  echo "Please run as root"
  exit 1
fi

cd ${SCRIPT_PATH}
mkdir -p /opt/docker/vpn
cp docker-compose.yml /opt/docker/vpn

cd /opt/docker/vpn
docker compose up -d

echo "=== END ==="

