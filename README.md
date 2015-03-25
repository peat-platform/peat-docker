# openi-docker

openi-docker divides the Cloudlet Platforms components into docker images.
These images may then be ran together to provide a modularised Cloudlet Platform.

## Getting started

### Installing Docker

Docker will be installed automatically in the setup script if using Ubuntu.

However due to docker using features specific to linux, for both Windows and OSX the program Boot2Docker must be installed.
Links to these are below: 
- [OSX](https://github.com/boot2docker/osx-installer/releases/tag/v1.4.1)
- [Windows](https://github.com/boot2docker/windows-installer/releases/tag/v1.4.1)

Installation guides for other OS's may be found [here](https://docs.docker.com/installation/)

### Using openi-docker

First pull or clone the project.

```bash
git clone https://github.com/OPENi-ict/openi-docker.git
```

Then configure the conf file, the two paths that must be changed are:
- OUTPUT_PATH
- CB_OUTPUT_PATH


Before you build the platform and to improve your Ubuntu servers security run the following command. Note the default users password
will be changed to the PASS value as set in the conf file. Logwatch send daily emails with system log information, set LOGWATCH_EMAIL
to you sysadmins.

```bash
bash provision_ubuntu_server.sh
```

Then run OPENi Docker using the following command:

```bash
bash setup.sh
```

This will install docker if needed, setup the output paths and run the platform.

## Additional Steps

A document in the db_keys bucket of couchbase must be created manually as couchbase does not supply REST endpoints for data manipulation within buckets.

* Temporarily allow port 8091 using the firewall tool 'ufw'.
* Navigate to the couchbase admin console <your ip address>:8091
* Select 'documents' for the db_keys bucket.
* Create an object named **dbkeys_29f81fe0-3097-4e39-975f-50c4bf8698c7** and Enter the following:

~~~json   
{
  "dbs": [
    "users",
    "clients",
    "authorizations",
    "queries"
  ]
}
~~~

* Disable port 8091 using ufw.


 
