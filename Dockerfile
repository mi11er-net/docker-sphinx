FROM python:2.7.14-alpine3.6@sha256:425b6c782dbfe7f601eab738cf7e2d0588197356aa36fe1a92012c368ebeed31

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
