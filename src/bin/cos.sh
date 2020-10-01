#!/bin/bash
# ======================================================================
# description: gather the cloud object storage (cos) data
# ======================================================================
# source the env files. check in current dir and up one, to allow
# for folks calling these scripts directly and from the main script
[[ -f .env ]] && source .env
[[ -f ../.env ]] && source ../.env
IFS=$'\n'
# ======================================================================

# Main()

instances=$(jq '.[] | [.resource_id, .crn] | @csv' audit-output/resource-service-instances.json | awk -F, '{print $1","$2}' | sed 's/\"//g' | sed 's/\\//g')

for instance in ${instances}; do
  id=$(echo $instance | awk -F, '{print $1}')
  crn=$(echo $instance | awk -F, '{print $2}')

  echo -e "\nGathering list of all buckets for ${id} using crn: ${crn}...\n"
  ibmcloud cos config crn --crn ${crn} --force
  ibmcloud cos buckets --ibm-service-instance-id ${crn} --output json > ${OUTDIR}/cos-buckets-${id}.json
done