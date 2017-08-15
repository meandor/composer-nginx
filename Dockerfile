FROM ubuntu:latest
RUN apt-get update && apt-get -y dist-upgrade -y && apt-get -y autoremove && apt-get -y install php7.0 php7.0-cli php7.0-mcrypt php7.0-mysql nginx curl openssl wget && rm -rf /var/lib/apt/lists/*
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && chown -R www-data:www-data /var/lib/nginx
RUN service nginx restart

COPY ./data/install-composer.sh .
RUN ./install-composer.sh

USER www-data
WORKDIR /var/www/html

CMD ["nginx"]

EXPOSE 80
EXPOSE 443