#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "$0")" && pwd)
LINUXDASH_HOME=${CURDIR}
MAIN_PY=${LINUXDASH_HOME}/python-server.py

PID=$(ps -ef | grep ${MAIN_PY} | grep -i 'python ' | awk '{print $2}')

if [[ ${PID} != "" ]]; then
    echo "Stopping pid: ${PID}"
    kill -15 ${PID}
fi
