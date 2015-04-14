# This file creates a Docker image containing the DAO

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49997 49902 49904 49906 49500 5984

# Install DAO
RUN git clone https://github.com/OPENi-ict/dao.git
RUN cd dao/ && npm install

ADD docker-runner.js /dao/lib/

WORKDIR /dao/lib/

ENTRYPOINT ["node", "docker-runner.js"]
