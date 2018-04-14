FROM python:2.7.14-alpine3.6@sha256:8b3366ac203d24ec031c64177d86cbc0b554f08732756883e08fbb8d2b537747

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
