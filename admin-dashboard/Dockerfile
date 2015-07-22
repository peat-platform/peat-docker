# This file creates a Docker image containing the PEAT auth dialogs

FROM peatplatform/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Install peat auth dialogs
RUN sudo apt-get -y update && sudo apt-get install -y build-essential python && \
    git clone https://github.com/peat-platform/admin-dashboard.git && \
    cd admin-dashboard/ && npm install && \
    sudo apt-get purge -y python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y


WORKDIR /admin-dashboard

ENTRYPOINT ["node", "bin/www"]
