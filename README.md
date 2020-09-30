# ibmcloud-audit

A simple information gathering tool for IBM Cloud

## Running (the easy way)

1. Clone this repo: `git clone https://github.com/rossja/ibmcloud-audit.git`
1. Run the image: `docker-compose run ibmcloud-audit`
1. In the container, log in to IBM Cloud
    - That can be done several ways, one of them is `ibmcloud login`
1. Enter the code directory in the container: `cd /root/ibmcloud-audit`
1. Set up the .env file: `cp .env.example .env`
1. Run the audit script: `ibmcloud-audit.sh`
