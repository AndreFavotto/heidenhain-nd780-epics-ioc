#!/bin/bash

set +u

. ./parseOPTArgs.sh "$@"

if [ $? -ne 0 ]; then
	echo "Could not parse command-line options" >&2
	exit 1
fi

set -u
set +e

PORT="$PORT" P="$P" R="$R" ./st.cmd