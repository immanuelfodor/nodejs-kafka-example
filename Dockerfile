FROM node:10-alpine

ARG WDIR=/usr/local/app

RUN apk --no-cache add \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python

RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash

RUN mkdir -p ${WDIR}

WORKDIR ${WDIR}

VOLUME ${WDIR}

ENV WDIR=${WDIR}
ENV JS_FILE consumer.js

CMD ["bash", "-c", "${WDIR}/docker-entrypoint.sh ${WDIR} ${JS_FILE}"]
