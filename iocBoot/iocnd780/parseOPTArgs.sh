#!/bin/bash

set -e

usage () {
    echo "Usage:" >&2
    echo "  $1 -p [PORT] -P [P_VAL] -R [R_VAL] " >&2
    echo >&2
    echo " Options:" >&2
    echo "  -p                  Configure nd780 serial port" >&2
    echo "  -P                  Configure value of \$(P) macro" >&2
    echo "  -R                  Configure value of \$(R) macro" >&2
}

while getopts ':p:P:R:' opt; do
    case "$opt" in
        p) PORT="$OPTARG" ;;
        P) P="$OPTARG" ;;
        R) R="$OPTARG" ;;
        ?) echo "Invalid -$OPTARG command option.">&2
        usage $0
        exit 1
        ;;
        :) echo "Missing argument -$OPTARG">&2
        usage $0
        exit 1
        ;;
    esac
done

if [ "$OPTIND" -le "$#" ]; then
    echo "Invalid argument at index '$OPTIND' does not have a corresponding option." >&2
    usage $0
    exit 1
fi