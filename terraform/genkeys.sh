#!/usr/bin/env bash
# Generates $1-times RSA keypairs

set -e
set -o pipefail

N=1
PREFIX=key
DIR=keys

usage() {
    echo "genkeys.sh - Generate one or more RSA 4096 bit keypairs
Usage:
$ bash genkeys.sh [OPTIONS]

Options:
    -h              Display this help.
    -n <count>      Specify number of keys you want to generate. Needs to be a digit greater 0. Defaults to 1.
    -p <prefix>     Specify prefix each key should have as a name (e.g. key-1, key-2, etc.). Can only consist of letters and digits. Defaults to 'key'."
}

while getopts ":hn:p:" o; do
    case "${o}" in
        h ) 
            usage
            exit 0
            ;;
        n )
            if [[ -n ${OPTARG} && $OPTARG =~ ^[0-9]+$  && (( $OPTARG > 0 )) ]]; then
                N=$OPTARG
            else
                echo "Invalid option for -$OPTARG. Please specify an integer > 0"
                usage
                exit 1
            fi
            ;;
        p )
            if [[ -n $OPTARG && $OPTARG =~ ^[a-zA-Z0-9]+$ ]]; then
                PREFIX=$OPTARG
            else
                echo "Invalid prefix, cannot contain symbols other than letters and digits."
                usage
                exit 1
            fi
            ;;
        \? )
            echo "Unknown option -$OPTARG"
            usage
            exit 1
            ;;
        : )
            echo "Missing parameter for -$OPTARG"
            usage
            exit 1
            ;;
        * )
            echo "Unimplemented option -$OPTARG"
            usage
            exit 1
            ;;
    esac
done
shift $(($OPTIND - 1))

# Create dir if necessary
if [[ ! -d ./$DIR ]]; then
    mkdir ./$DIR
fi

# Generate keys
for (( i=1; i <= $N; i++ )); do
    ssh-keygen -b 4096 -t rsa -f ./$DIR/$PREFIX-$i -q -N "" -C ""
    mv ./$DIR/$PREFIX-$i ./$DIR/$PREFIX-$i.pem
    chmod 0400 ./$DIR/$PREFIX-$i.pem
    chmod 0444 ./$DIR/$PREFIX-$i
done
