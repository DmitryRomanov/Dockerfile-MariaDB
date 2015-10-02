FROM mariadb:10.0.21
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "puppet"]
RUN ["puppet", "agent", "--enable"]

CMD rm -f /var/lib/puppet/state/agent_catalog_run.lock ; /usr/bin/puppet agent --test ; /bin/bash