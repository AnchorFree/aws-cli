FROM alpine:3.8
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        && \
        adduser -D -u 1000 -s /bin/sh aws && \
        pip install --upgrade pip && \
        pip install awscli==1.15.66 --upgrade && \
        apk -v --purge del py-pip && \
        rm /var/cache/apk/*

USER aws
WORKDIR /home/aws

COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["/home/aws/entrypoint.sh"]
