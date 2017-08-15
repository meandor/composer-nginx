FROM ubuntu:latest
RUN apt-get update && apt-get -y dist-upgrade -y && apt-get -y autoremove && apt-get -y install php7.0 php7.0-cli php7.0-mcrypt php7.0-mysql nginx curl openssl wget
RUN service nginx restart

COPY ./data/install-composer.sh .
RUN ./install-composer.sh

USER daemon
WORKDIR /var/www/html

# Expose ports.
EXPOSE 80
EXPOSE 443