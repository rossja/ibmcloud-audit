FROM rossja/ncc-scoutsuite:latest
LABEL maintainer="algorythm@gmail.com"

COPY .env.example /root/.env

ENTRYPOINT [ "bash" ]