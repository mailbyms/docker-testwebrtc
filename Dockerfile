### phase 1
FROM node:12.22.6 

WORKDIR /

RUN git clone https://github.com/webrtc/testrtc \
    && cd testrtc \
    && npm install \
    && npm i -g bower grunt \
    && bower update \
    && grunt \
    && grunt build

### phase 2
FROM nginx:1.18.0

COPY --from=0 /testrtc/out/src /usr/share/nginx/html

EXPOSE 80 


