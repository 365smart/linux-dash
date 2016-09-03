#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "$0")" && pwd)
LINUXDASH_HOME=${CURDIR}
MAIN_PY=${LINUXDASH_HOME}/python-server.py

LOGFILE=${LINUXDASH_HOME}/linuxdash.log

set +e # disable exit on error
# backup last few log files
mkdir -p ${LINUXDASH_HOME}/logs
mv ${LOGFILE}.3 ${LINUXDASH_HOME}/logs/linuxdash.log.$(date +%Y%m%d%H%M%S) > /dev/null 2>&1
mv ${LOGFILE}.2 ${LOGFILE}.3 > /dev/null 2>&1
mv ${LOGFILE}.1 ${LOGFILE}.2 > /dev/null 2>&1
mv ${LOGFILE} ${LOGFILE}.1 > /dev/null 2>&1
set -e # enable exit on error

echo logfile: ${LOGFILE}
(set -x
nohup python ${MAIN_PY} > ${LOGFILE} 2>&1 &
)

