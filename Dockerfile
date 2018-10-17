FROM python:3.7.0-alpine3.8

RUN apk --no-cache add --update \ 
    git \ 
    openssh \ 
    npm \    
    postgresql-libs \
    && apk --no-cache add --virtual \
    .build-deps \
    gcc \ 
    musl-dev \ 
    postgresql-dev \
    && npm install -g heroku \
    && pip install --no-cache-dir pipenv flake8 flake8-per-file-ignores \
    && npm cache --force clean  \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

WORKDIR /app

ONBUILD COPY . /app
