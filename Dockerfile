FROM dmitryromanov85/mariadb_novolumes:10.2
MAINTAINER Dmitry Romanov "dmitry.romanov85@gmail.com"

RUN apt-get update && apt-get install -y \
    puppet \
    mariadb-connect-engine-10.0 \
    nano \
 && rm -rf /var/lib/apt/lists/*

COPY bash.bashrc /etc/bash.bashrc
COPY puppet.conf /etc/puppet/puppet.conf
RUN ["puppet", "agent", "--enable"]

CMD rm -f /var/lib/puppet/state/agent_catalog_run.lock ; /usr/bin/puppet agent --test ; /bin/bash
