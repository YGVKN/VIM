FROM ubuntu:latest
MAINTAINER ZHUZHA
LABEL YGVKN ZHUZHA
RUN apt-get update && apt-get upgrade -y
WORKDIR /app
#RUN addgroup -g 1001 -S zhuzha && zhuzha -u 1001 -S zhuzha  -G zhuzha
#HEALTHCHECK --interval=8m --timeout=4s CMD wget -qO- 0.0.0.0:8888 || exit 1
STOPSIGNAL SIGTERM
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null 2>&1"]

