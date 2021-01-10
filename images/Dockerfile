FROM ruby:latest
MAINTAINER ZHUZHA
LABEL Ruby plus_env
WORKDIR /usr/src/app
STOPSIGNAL SIGTERM
#HEALTHCHECK --interval=8m --timeout=4s CMD wget -qO- 0.0.0.0:8888 || exit 1
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
#RUN Ruby

