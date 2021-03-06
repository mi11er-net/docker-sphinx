FROM python:2.7.14-alpine3.6@sha256:02abf538701c3643c37b15a72930caed8953df1938dd4db9b861d37f8ca7b199

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
