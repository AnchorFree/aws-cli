#!/usr/bin/env sh

TIMEOUT=${TIMEOUT:-"300"}

if [ -z ${AWS_ACCESS_KEY_ID} ]; then
        echo "AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are mandatory"
    exit 1
fi

if [ -z ${AWS_SECRET_ACCESS_KEY} ]; then
        echo "AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are mandatory"
    exit 1
fi

AWS_REGION=${AWS_REGION:-'us-east-1'}

ALIVE=1
trap ALIVE=0 SIGTERM

if [ ! -z "${EXEC_ON_START}" -a -x "${EXEC_ON_START}" ]; then
    ${EXEC_ON_START}
fi

while [ "$ALIVE" -eq "1" ]; do
    if [ ! -z "${EXEC_PRE_ITERATION}" -a -x "${EXEC_PRE_ITERATION}" ]; then
        . ${EXEC_PRE_ITERATION}
    fi

    echo -e "$@" | /bin/sh
    sleep ${TIMEOUT} &
    wait
done
