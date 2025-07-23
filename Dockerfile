FROM ubuntu:16.04

RUN echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/01unauth

RUN apt-get update && \
    apt-get install -y \
    openssl \
    curl \
    wget \
    netcat \
    telnet \
    nmap \
    apache2 \
    php

EXPOSE 22

# hardcoded secrets
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root123
ENV SECRET_KEY="abc123"

COPY . /var/www/html/

# Run web server as root 
USER root
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
