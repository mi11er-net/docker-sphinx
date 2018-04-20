FROM python:2.7.14-alpine3.6@sha256:5f75fc77c6ad372ff4ce4fe3b076adcf7ff304fdb18fb677e7a4724497a13d60

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
