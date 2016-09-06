#!/bin/bash

# get absolute path to config file
SCRIPTPATH=`dirname $(readlink -f $0)`
APP_PROPS=$SCRIPTPATH/../../../application.properties

app_version=`grep 'app.version' $APP_PROPS | sed -r 's/app.version=//'`

echo { \
    \"App Version\": \"$app_version\" \
  }
