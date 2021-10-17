FROM golang:alpine as BASE
MAINTAINER YGVKN
LABEL YGVKN ZHUZHA
WORKDIR /other_stuff
RUN export CGO_ENBLED=0 && go env && apk --no-cache --update add ca-certificates git build-base \
    && git clone https://github.com/GoogleContainerTools/kaniko.git && cd kaniko \
    && go mod tidy && go mod verify \
    && go install -ldflags="-s -w" ./... \
    && go env GOPATH && ls -al /go/bin \
    && /go/bin/executor --help \
    && rm -rf /var/cache/apk/* \
    && ps aux | sort -nk 4 && ps aux | sort -nk 3

FROM alpine:latest
MAINTAINER YGVKN
LABEL YGVKN ZHUZHA
WORKDIR /kaniko
COPY --from=BASE /go/bin /kaniko
#RUN export RES="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n${2:-"OK"}\r\n" \
#    && echo $RES && apk --no-cache --update add ca-certificates \
#    && ls -al /kaniko \
#    && /kaniko/executor --version \
#    && cat > /HEALTHCHECK <<-'EOF' \
#       while  echo -en "$RES";  | nc -l "${1:-8080}" \
#       do \
#        echo -e "[0;36mλ ..." \
#       done \
#       EOF
HEALTHCHECK --interval=3m --timeout=13s CMD cat /etc/*release* > /tmp/health_check || exit 1
STOPSIGNAL SIGTERM
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null","2>&1"]
