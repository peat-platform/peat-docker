# This file creates a Docker image containing the PEAT user dashboard

FROM peatplatform/cloudlet_core 
MAINTAINER Dylan Conway <dconway@tssg.org>

# Install PEAT auth dialogs
RUN sudo apt-get -y update && sudo apt-get install -y build-essential python && \
    git clone https://github.com/peat-platform/user-dashboard.git && \
    cd user-dashboard/ && git checkout DockerBugFixing && npm install && \
    sudo apt-get purge -y python gcc && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove -y

WORKDIR /user-dashboard/

ENTRYPOINT ["node", "bin/www"]