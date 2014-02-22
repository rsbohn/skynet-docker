# skynet.im preview Dockerfile
#
# version 0.0.0
# 
# start with dockerfile/nodejs
# (trusted build) sudo docker pull dockerfile/nodejs
# (from github) sudo docker build -t=dockerfile/nodejs github.com/dockerfile/nodejs
FROM dockerfile/nodejs
MAINTAINER Randall Bohn <rsbohn@gmail.com>

RUN git clone https://github.com/skynetim/skynet.git /skynet
WORKDIR /skynet
RUN npm install
ADD config.js /skynet/config.js

ENV RATELIMIT 10
ENV PORT 5000
EXPOSE 5000
#ENTRYPOINT node /skynet/server.js
