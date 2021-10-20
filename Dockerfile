### phase 1
FROM node:12.22.6 

RUN apt update \
    && apt install -y git \
    && git clone https://github.com/webrtc/testrtc

RUN cd testrtc \
    && npm install \
    && npm i -g bower grunt \
    && bower update \
    && grunt \
    && grunt build

### phase 2
FROM nginx:1.18.0

COPY --from=0 /testrtc/out/src /usr/share/nginx/html

EXPOSE 80 


