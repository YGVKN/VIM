FROM ubuntu
MAINTAINER ZHUZHA
LABEL YGVKN ZHUZHA
RUN apt-get update && apt-get upgrade -y
WORKDIR /
EXPOSE 8888
HEALTHCHECK --interval=8m --timeout=4s CMD cat /etc/*release* || exit 1
STOPSIGNAL SIGTERM
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null","2>&1"]

