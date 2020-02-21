FROM node:12-alpine

LABEL maintainer="henrique.schmidt@somosphi.com"

ARG SONAR_SCANNER_VERSION="sonar-scanner-cli-3.3.0.1492-linux"

# run
RUN apk update && \
    apk add --no-cache bash git openssh curl zip python3 make gcc g++ mysql-client && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    pip install --upgrade pip && \
    pip install awscli --upgrade  && \
    npm install -g typescript ts-node

# Install sonar-scanner
ADD https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_SCANNER_VERSION}.zip /tmp/sonarscanner.zip
RUN unzip /tmp/sonarscanner.zip -d /opt/ && \
    mv -v /opt/sonar-scanner*/ /opt/sonar-scanner/ && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/ && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner-debug /usr/local/bin/
