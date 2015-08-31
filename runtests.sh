#!/bin/bash -e

if test -z "${WEBRUNNER_SCRIPTS}"; then
    echo '*** ERROR: set at least -e WEBRUNNER_SCRIPTS="testfile.wt ..."'
    echo "    optional variables: XVFB_SERVER_ARGS, WEBRUNNER_ARGS"
    exit 1
fi

xvfb-run -a --server-args="${XVFB_SERVER_ARGS:--screen 0 2048x2048x24}" \
    webrunner ${WEBRUNNER_ARGS:--W 2048 -H 2048 -sx testoutput.xml} \
              ${WEBRUNNER_SCRIPTS}
