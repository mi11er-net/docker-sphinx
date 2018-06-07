FROM python:2.7.15-alpine3.6@sha256:867f0791cd905d3359d493a4c1785968d686d5e4f5acc20f80e6ffd4a39dcbb0

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
