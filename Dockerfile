FROM rossja/ncc-scoutsuite:latest as builder
LABEL maintainer="algorythm@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=linux

RUN apt-get update && apt-get -y install jq

FROM builder
ENTRYPOINT [ "bash" ]
