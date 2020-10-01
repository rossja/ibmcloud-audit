#!/bin/bash
# ======================================================================
# description: gather the reource data
# ======================================================================
# source the env files. check in current dir and up one, to allow
# for folks calling these scripts directly and from the main script
[[ -f .env ]] && source .env
[[ -f ../.env ]] && source ../.env
IFS=$'\n'
# ======================================================================

# Main()

echo -e "\nGathering list of all service instances...\n"
ibmcloud resource service-instances --output json > ${OUTDIR}/resource-service-instances.json