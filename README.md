# Docker Telegram Mirror
A docker image to create telegram web mirror in one step.

## Usage
``` bash
$ docker run -d -p 80:80 seedgou/telegram-mirror
```

## Known issue
[Offical telegram web appcache](https://web.telegram.org/webogram.appcache) requires `vendor/recorderjs/encoder_worker.js` to be cached, however this file does not exists in [webogram release files](https://github.com/zhukov/webogram/releases/download/v0.5.7/webogram_v0.5.7.zip).