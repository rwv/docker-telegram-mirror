FROM nginx:alpine

LABEL maintainer="seedgou <seedgou@gmail.com>"

RUN apk --no-cache add unzip wget \
    && wget https://github.com/zhukov/webogram/releases/download/v0.5.7/webogram_v0.5.7.zip \
    && unzip -o webogram_v0.5.7.zip -d /usr/share/nginx/html \
    && rm webogram_v0.5.7.zip \
    && wget -O /usr/share/nginx/html/webogram.appcache https://web.telegram.org/webogram.appcache \ 
    && sed -i 's/"https:\/\/"+l+".web.telegram.org\/"/"\/"+l+"\/"/g' /usr/share/nginx/html/js/app.js \
    && apk del unzip wget

# FIXME: vendor/recorderjs/encoder_worker.js is in https://web.telegram.org/webogram.appcache 
# but not in https://github.com/zhukov/webogram/releases/download/v0.5.7/webogram_v0.5.7.zip

COPY nginx.conf /etc/nginx/nginx.conf
