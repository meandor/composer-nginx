FROM ubuntu:latest
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y php7.0 php7.0-cli php7.0-mcrypt php7.0-mysql nginx && apt-get autoremove -y
RUN service nginx restart
COPY data/ .
RUN ./install-composer.sh
USER daemon
WORKDIR /var/www/html