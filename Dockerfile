FROM mariadb:10.0.22
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["rm", "-Rf", "/var/lib/mysql/; exit 0"]
RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "puppet", "mariadb-connect-engine-10.0", "nano"]

COPY bash.bashrc /etc/bash.bashrc
COPY puppet.conf /etc/puppet/puppet.conf
RUN ["puppet", "agent", "--enable"]

CMD rm -f /var/lib/puppet/state/agent_catalog_run.lock ; /usr/bin/puppet agent --test ; /bin/bash
