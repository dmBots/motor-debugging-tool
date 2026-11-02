#!/bin/bash

DIR=$(cd "$(dirname "$0")"; pwd)

export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH
export QT_PLUGIN_PATH=$DIR/plugins

sudo chmod +x "$DIR/bin/serial-port-assistant"
$DIR/bin/serial-port-assistant "$@"
