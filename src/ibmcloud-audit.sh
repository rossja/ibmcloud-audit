#!/bin/bash
source .env

# move to the base
cd ${BASEDIR}

# create the working directory
mkdir -p ${WORKDIR}

# -------------------------------
#          RRRUUUNNNNN!
# -------------------------------

# gather the resource data
./bin/resource.sh

# gather the account data
./bin/account.sh

# gather the cloud object storage data
./bin/cos.sh