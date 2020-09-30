# ibmcloud-audit

A simple information gathering tool for IBM Cloud

# Running

One way to get this all running quickly is to use the [ncc-scoutsuite](https://github.com/rossja/ncc-scoutsuite)
container as a base. That can be set up by doing something like this:

1. Clone this repo: `git clone https://github.com/rossja/ibmcloud-audit.git`
1. Grab the docker image: `docker pull rossja/ncc-scoutsuite:latest`
1. Run the container, passing in the repo as a volume: `docker run -it -v ibmcloud-audit:/root/data rossja/ncc-scoutsuite bash`
1. In the container, log in to IBM Cloud
    1. That can be done several ways, one of them is `ibmcloud login`
1. Change to the volume you mounted the repo as: `cd /root/data`
1. Run the audit script: `ibmcloud-audit.sh`
