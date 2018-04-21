FROM python:2.7.14-alpine3.6@sha256:a6317c6b7f532a357fd774d4ac18fff2bdb6c4092e3f6b9a473bc59fc7232d38

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
