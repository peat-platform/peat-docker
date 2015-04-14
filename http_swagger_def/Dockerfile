# This file creates a Docker image containing the Swagger Def program

FROM openiicteu/cloudlet_core 
MAINTAINER Aiden Keating <akeating@tssg.org>

# Expose required ports
EXPOSE 49908 49907

# Install Swagger Def
RUN git clone https://github.com/OPENi-ict/swagger-def.git
RUN cd swagger-def/ && npm install

ADD docker-runner.js /swagger-def/lib/

WORKDIR /swagger-def/lib/

ENTRYPOINT ["node", "docker-runner.js"]
