#!/bin/env bash
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_NC='\033[0m'

APT_SOURCES_DIR="/etc/apt/sources.list.d"
USTC_CEPH_SOURCE="deb https://mirrors.ustc.edu.cn/proxmox/debian/ceph-quincy bookworm no-subscription"
USTC_ENTERPRISE_SOURCE="deb https://mirrors.tuna.tsinghua.edu.cn/proxmox/debian bookworm pve-no-subscription"

if [ ! -e ${APT_SOURCES_DIR}/ceph.list.bak ]; then
  echo -e "${COLOR_YELLO}ceph.list backup file don't exists. create it.${COLOR_NC}"
  mv ${APT_SOURCES_DIR}/ceph.list ${APT_SOURCES_DIR}/ceph.list.bak
  echo "${USTC_CEPH_SOURCE}" > ${APT_SOURCES_DIR}/ceph.list
else
  echo -e "${COLOR_GREEN} ceph.list backup file exists. configure new ceph.list${COLOR_NC}"
  echo "${USTC_CEPH_SOURCE}" > ${APT_SOURCES_DIR}/ceph.list
fi

if [ ! -e ${APT_SOURCES_DIR}/pve-enterprise.list.bak ]; then
  echo -e "${COLOR_YELLO}pve-enterprise.list backup file don't exists. create it.${COLOR_NC}"
  mv ${APT_SOURCES_DIR}/pve-enterprise.list ${APT_SOURCES_DIR}/pve-enterprise.list.bak
  echo "${USTC_ENTERPRISE_SOURCE}" > ${APT_SOURCES_DIR}/pve-enterprise.list
else
  echo -e "${COLOR_GREEN}pve-enterprise.list backup file exists. configure new ceph.list${COLOR_NC}"
  echo "${USTC_ENTERPRISE_SOURCE}" > ${APT_SOURCES_DIR}/pve-enterprise.list
fi

