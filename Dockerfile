FROM mhart/alpine-node

RUN apk add --update \
    python \
    build-base

RUN mkdir /code
COPY package.json /code
WORKDIR /code
RUN npm install

COPY . /code

