ARG APT_SOURCE="default"

FROM node:20-alpine as base
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash \
      ca-certificates \
      chromium-chromedriver \
      chromium \
      coreutils \
      curl \
      ffmpeg \
      figlet \
      jq \
      moreutils \
      ttf-freefont \
      udev \
      vim \
      xauth \
      xvfb \
    && rm -rf /tmp/* /var/cache/apk/*


FROM base as builder-default
ENV NPM_REGISTRY="https://registry.npmmirror.com"

FROM base as builder-aliyun
ENV NPM_REGISTRY="https://registry.npmmirror.com"


FROM builder-${APT_SOURCE}

ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN mkdir -p /app
WORKDIR /app

COPY package.json ./
RUN npm config set registry ${NPM_REGISTRY} && npm i

COPY *.js ./
COPY src/ ./src/

CMD ["npm", "run", "dev"]
