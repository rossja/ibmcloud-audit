#!/bin/bash
source .env

# move to the base
cd ${BASEDIR}

# create the working directory
mkdir -p ${WORKDIR}

# -------------------------------
#          RRRUUUNNNNN!
# -------------------------------

# gather the account data for the logged in user
./bin/account.sh