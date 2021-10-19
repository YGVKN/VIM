FROM golang:bullseye as BASE
MAINTAINER YGVKN
LABEL YGVKN ZHUZHA
WORKDIR /other_stuff
RUN set -eux; \
    apt update -yqq --no-install-recommends; \
    git clone https://github.com/GoogleContainerTools/kaniko.git && cd kaniko \
    && go mod tidy && go mod verify && go env \
    && go install   -ldflags="-s -w" ./... \
    && rm -rf /var/lib/apt/lists/*

FROM debian:bullseye
MAINTAINER YGVKN
LABEL YGVKN ZHUZHA
WORKDIR /kaniko
COPY --from=BASE /go/bin /kaniko
RUN set -eux; apt update && apt install net-tools wget ncat -yqq --no-install-recommends; rm -rf /var/lib/apt/lists/*;
#    echo -en "HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n${2:-"OK"}\r\n" | ncat -k -l  127.0.0.1 4444 &
#
#HEALTHCHECK --interval=1m --timeout=13s CMD wget -qO-  0.0.0.0:4444 || true
STOPSIGNAL SIGTERM
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null","2>&1"]
