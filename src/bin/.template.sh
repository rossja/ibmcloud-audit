#!/bin/bash
# ======================================================================
# description: a template for creating scripts
# ======================================================================
# source the env files. check in current dir and up one, to allow
# for folks calling these scripts directly and from the main script
[[ -f .env ]] && source .env
[[ -f ../.env ]] && source ../.env
IFS=$'\n' # this is critical if a resource or org name has spaces
# ======================================================================

# Main()

# put your code here