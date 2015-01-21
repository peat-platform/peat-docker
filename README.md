# openi-docker

openi-docker divides the Cloudlet Platforms components into docker images.
These images may then be ran together to provide a modularised Cloudlet Platform.

## Getting started

### Installing Docker

Docker must be installed to use openi-docker.
Installation can be done through aptitude as follows:

```bash
apt-get install docker.io
```

However due to docker using features specific to linux, for both Windows and OSX the program Boot2Docker must be installed.
Links to these are below: 
- [OSX](https://github.com/boot2docker/osx-installer/releases/tag/v1.4.1),
- [Windows](https://github.com/boot2docker/windows-installer/releases/tag/v1.4.1)

Installation guides for other OS's may be found [here](https://docs.docker.com/installation/)

### Using openi-docker

First pull or clone the project.

```bash
git clone https://github.com/OPENi-ict/openi-docker.git
```

Then build the docker images.

```bash
cd openi-docker
sh utils/build_all.sh
```

Finally run all of the images as containers.

```bash
sh utils/run_all.sh
```

## Note

- Currently each container is isolated, they will not communicate between each other.
- Currently the ```teardown_containers.sh``` and the ```teardown_images.sh``` utility scripts will remove ALL docker containers and images.

 
