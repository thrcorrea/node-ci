FROM node:12-alpine

LABEL maintainer="henrique.schmidt@somosphi.com"

# run
RUN apk update && \
    apk add --no-cache bash git openssh curl zip python3 make gcc g++ mysql-client && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    pip install --upgrade pip && \
    pip install awscli --upgrade  && \
    npm install -g typescript
