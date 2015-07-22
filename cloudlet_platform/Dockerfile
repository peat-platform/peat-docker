# This file creates a Docker image containing the Cloudlet Platform program

FROM peatplatform/cloudlet_core 
MAINTAINER Dylan Conway <dconway@tssg.org>

# Expose required ports
# EXPOSE 49908 49907

# Install Cloudlet Platform
RUN git clone https://github.com/peat-platform/cloudlet-platform.git
RUN cd cloudlet-platform/ && npm install
RUN npm install commander

ADD docker-worker-runner.js /cloudlet-platform/lib/

WORKDIR /cloudlet-platform/lib/

ENTRYPOINT ["node", "docker-worker-runner.js"]
