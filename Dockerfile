FROM ubuntu
MAINTAINER ZHUZHA
LABEL YGVKN ZHUZHA
RUN apt-get update && apt-get upgrade -y
WORKDIR /app
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null","2>&1"]

