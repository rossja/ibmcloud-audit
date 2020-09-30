#!/bin/bash
# ======================================================================
# description: gather the account data for the logged in user
# ======================================================================
# source the env files. check in current dir and up one, to allow
# for folks calling these scripts directly and from the main script
[[ -f .env ]] && source .env
[[ -f ../.env ]] && source ../.env
IFS=$'\n' # this is critical if a resource or org name has spaces
# ======================================================================

# Main()

echo -e "\nGathering details for currently logged in account...\n"
ibmcloud account show --output json > ${OUTDIR}/account-show.json

echo -e "\nGathering list of all orgs...\n"
ibmcloud account orgs -r all -u all --output json > ${OUTDIR}/account-orgs.json

echo -e "\nGathering list of all accounts...\n"
ibmcloud account list --output json > ${OUTDIR}/account-list.json

echo -e "\nProcessing data to prepare for additional checks...\n"
orgs=$(jq '.[] | [.OrgName, .OrgGuid,.Region] | @csv' audit-output/account-orgs.json | awk -F, '{print $1","$2","$3}'|sed 's/\"//g'|sed 's/\\//g')

for org in ${orgs}; do
  name=$(echo $org|awk -F, '{print $1'})
  id=$(echo $org|awk -F, '{print $2'})
  region=$(echo $org|awk -F, '{print $3'})

  echo -e "\nChecking spaces for ${name} in region: ${region}...\n"
  ibmcloud account spaces -o ${name} -r ${region} --output json > ${OUTDIR}/account-spaces-${name}-${region}.json
done