FROM python:2.7.13-alpine3.6@sha256:94f93eaae990ff35f83492048ab6c7bab942f885b0ae8570c863d4cd35f07a8f

LABEL name='sphinx'
LABEL version="1.0"

RUN  apk add --no-cache --virtual .sphinx-run-deps make \
     && pip install sphinx sphinx-autobuild

copy /docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["make"]
