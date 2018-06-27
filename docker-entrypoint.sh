#!/bin/bash

POJECT_DIR=$1
JS_FILE=$2

cd ${POJECT_DIR}
npm install
. ./.env 
node ${JS_FILE}
