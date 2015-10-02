FROM mariadb:10.0.21
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "puppet"]
