FROM alpine:latest
RUN apk add --update \
    python3 \
    python3-dev \
    py3-pip \
    build-base \
  && pip3 install virtualenv \
  && rm -rf /var/cache/apk/*
WORKDIR /app
ONBUILD COPY . /app
ONBUILD RUN virtualenv /env && /env/bin/pip3 install -r /app/requirements.txt
EXPOSE 8080
CMD ["/env/bin/python3", "server.py"]