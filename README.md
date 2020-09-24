# Dockerpresso

Docker + Rapid Wordpress Development = Dockerpresso


Docker Compose configuration generator for fast Wordpress theme or plugin development.

## Getting started

Let's go straight to your shell:

```sh
# install dockerpresso
curl -O https://raw.githubusercontent.com/michaloo/dockerpresso/master/bin/dockerpresso && chmod +x dockerpresso && mv dockerpresso /usr/local/bin

# create your project directory
mkdir your-new-project && cd your-new-project

# initialize dockerpresso configuration
dockerpresso init

# decide what you want to develop and how to inject that into wordpress installation
subl docker-compose.yml

# write any additional provisioning script for adding plugins etc.
subl Dockerpressofile

# quickly review the wp-config.php setup
subl .env

# run it!
dockerpresso up
```

Open your Docker host name or ip in your browser. Fresh Wordpress installation
with your plugin or theme mounted in `wp-content` directory is ready to work on!

## Basic usage

Once dockepresso is installed start by initializing your project:

`dockerpresso init`

It will generate following files in your project root:

```
.env
/docker-compose.yml
/docker-compose.admin.yml
Dockerpressofile
```

* `.env` contains environmental variables which controls your setup and wp-config.php

* `docker-compose.yml` contains base Docker configuration for two services
`web` and `mysql`

* `docker-composer.admin.yml` contains configuration for two additional one-time
commands services `web-cli` and `mysql-cli`

* `Dockerpressofile` is a script where wp-cli can be used to prepare Wordpress installation (e.g. install required plugins)

Please edit those files according to your needs and start the service.


`dockerpresso up`

Which will start web and mysql services.
After launching it you should be able to complete Wordpress installation
process when opening in browser your Docker host name or ip.

## Installation

Dockerpresso is simple bash script. It requires bash, docker and docker-compose to run.

You can install it with following one-liner to install it in `/usr/local/bin`:

`curl -O https://raw.githubusercontent.com/michaloo/dockerpresso/master/bin/dockerpresso && chmod +x dockerpresso && mv dockerpresso /usr/local/bin`


