# The OPENi docker guide
![Front cover](http://cdn.meme.am/instances/500x/56920837.jpg)
This guide aims to aid a user in downloading, installing, updating and contributing to OPENi docker.
It aims to answer a series of questions, these are:
* What is docker?
* What is OPENi docker?
* How do I install docker?
* How do I install OPENi docker?
* How do I edit docker code?

## What is docker?
According to docker.com

>Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications. Consisting of Docker Engine, a portable, lightweight runtime and packaging tool, and Docker Hub, a cloud service for sharing applications and automating workflows, Docker enables apps to be quickly assembled from components and eliminates the friction between development, QA, and production environments. As a result, IT can ship faster and run the same app, unchanged, on laptops, data center VMs, and any cloud.

In short docker can be thought of as a platform for hosting light-weight virtual machines. These machines are defined using a Dockerfile, which is a set of rules that are used to build a docker "image". Docker images can be thought of as a blueprint for a virtual machine, a docker image is static, it can not run any processes, it is similar to a powered of computer.

To run processed on a docker image you must create a docker "container", this allows a user to run a single main process on a machine, once this process is completed the container will die. This is part of the docker philosophy, each container should only do one specific task.

It is important to note for developers that the main docker process cannot be a daemon process, this will cause the docker container to die immediately, the main process must run in the foreground.

Dockers advantages over actual virtual machines are its speed (starting a new container can take less than a second in some cases compared to minutes for a new virtual machine) and space efficiency (if 10 containers are based off of the image 'ubuntu:14.04' and 'ubuntu:14.04' is 100mb then all 10 containers will still only take up 100mb).

A video introduction to Docker can be found [here](https://youtu.be/ZzQfxoMFH0U)

## What is OPENi docker?
OPENi docker is an attempt to take the OPENi project and run it upon docker, this required splitting the platform into individual docker images and running each image as a container, the containers must then link together to form a network of docker containers that can allow ZeroMQ and database communications between them.

As of the 27th March there are over 17 images in the OPENi docker project, each of these images house a single task that the OPENi project performs. Most of these images can be completely self contained at run-time, however a few  of them (namely the database) must persist data outside of the running docker containers so that if the containers die the data stored inside the database is not lost.

## How do I install docker?
![One does not simply install docker](http://i.imgur.com/nFGC7lK.jpg)

(Note this is performed with the provisioning script in OPENi docker for Ubuntu)

Docker required linux specific components to work, because of this Docker must be installed differently on different machines.

### Ubuntu
If you are using Ubuntu it is quite simple to install docker, first you must install AUFS so that you don't run into any issues with the devicemapper storage system. 

The reason for installing AUFS is that devicemapper causes errors on Ubuntu for reasons that are beyond all of us. To install AUFS run the following script.

```bash
sudo apt-get -y install linux-image-extra-$(uname -r)
```

Then run the following script to install Ubuntu.

```bash
$ wget -qO- https://get.docker.com/ | sh
```

You now have docker installed!

### OSX and Windows
As mentioned earlier Docker requires linux specific features, because of this it will not run natively on Windows or OSX, however there are solutions to this.

#### OSX
OSX users have two options, the Boot2Docker option or the new Kitematic option. Both of these have advantages however the choice can be easily decided by looking at the two options.

Kitematic is a GUI based application for OSX. It allows its users to search the Docker public repository, DockerHub, for images and then download and run them as containers. This has the advantages of being quick and simple however it does not allow for the vast docker tools to be utilised fully (also you don't get to look like a hacker because you don't use a real terminal)
![Kitematic GUI](https://blog.docker.com/media/Screenshot-2015-02-23-16.27.27.jpg)

You can install Kitematic from the following link.

[https://kitematic.com](https://kitematic.com)

The next option is Boot2Docker, this is in essence a light-weight linux virual machine running on virtualbox with Docker installed on it. This allows full use of docker from a terminal, because of this I would recommend it.

To install Boot2Docker follow the following link.

[https://docker.com](https://docs.docker.com/installation/mac/#command-line-docker-with-boot2docker)

#### Windows

For Windows there is only one option, Boot2Docker, the installation instructions are below.

[https://docker.com](https://docs.docker.com/installation/windows/)

#### Others

For all other Operating systems installation notes can be found on the docker website.

## How do I install OPENi docker?

If you're on ubuntu it's easy.

```bash
git clone www.github.com/OPENi-ict/openi-docker.git
cd openi-docker/
sudo bash provision_ubuntu_server.sh
```

You're done! Visit the IP address of the machine in your browser.

There are a small number of steps involved in installing OPENi docker without the provision script.

First pull the git repository.

```bash
git clone www.github.com/OPENi-ict/openi-docker.git
```

Then you can either build the images or download them. The rule of thumb of this choice is that if you have high internet speed then download them, else build them.

To download the images run. (If no $VERSION then leave it out to download latest)

```bash
cd openi-docker/
sudo bash utils/pull_all.sh $VERSION
```

To install the images run.

```bash
cd openi-docker/
sudo bash utils/build_all.sh
```

Then to run the OPENi platform you must edit the ``` conf ``` file, all but the first two variables ```C_LOG_PATH``` and ```M_LOG_PATH``` should be changed. You can also add your own certs into the ```mongrel2/certs/``` path.

Finally you can actually run the platform.

```bash
sudo bash utils/run_all.sh
```

Now all of the images will run as containers on your system, after this script completes go to ```http://localhost``` and you should see a running OPENi platform.

## How do I edit OPENi docker code?

You can edit the code rather easily, the Dockerfile syntax is explained clearly on the Docker website.

## Common issues
### I followed the Boot2Docker tutorial but I am not in a Boot2Docker prompt
This may be because you never entered the Boot2Docker prompt, try calling ```boot2docker ssh``` 
from the command prompt/terminal. 

If this does not fix your problem check that a Boot2Docker virtual machine is running in VirtualBox.

### That name already exists

This more than likely means you are attempting to run a second container with an already existing ```--name``` tag. Either do a ```sudo docker rm -f $CONTAINER_NAME``` and then run the other container or run the second container with a unique ```--name``` tag.

### Error mounting /dev/mapper/

This means that you are using the ```devicemapper``` storage driver. To confirm this run ```sudo docker info``` and look for ```Storage Driver:```. If it says "devicemapper" then you need to install AUFS and restart the docker daemon.

```bash
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo service docker restart
```

Rerun ```docker info``` and make sure it says aufs where it used to say devicemapper.

