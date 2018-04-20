FROM python:2.7.14-alpine3.6@sha256:06c3305af5b82099a3e1b17f2ecc1d58ad0bbed918d38eea25befc72227edde8

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
