# This file creates a Docker image containing the Cloudlet Platform program

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
# EXPOSE 49908 49907

# Install Cloudlet Platform
RUN git clone https://github.com/OPENi-ict/cloudlet-platform.git
RUN cd cloudlet-platform/ && npm install
RUN npm install commander

ADD docker-worker-runner.js /cloudlet-platform/lib/

WORKDIR /cloudlet-platform/lib/

ENTRYPOINT ["node", "docker-worker-runner.js"]
