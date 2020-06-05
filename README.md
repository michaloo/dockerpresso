# Dockerpresso

Docker Compose configuration generator for fast Wordpress theme or plugin development.

More information about reasons behind Dockerpresso are presented in [this blog post](https://medium.com/@michaloo/express-wordpress-theme-and-plugin-development-environment-e077d52535e0).

## Fast start

Let's go straight to your shell:

```sh
# create your project directory
mkdir your-new-project && cd your-new-project
# install dockerpesso using docker installer image
docker run --rm -v `pwd`:/project michaloo/dockerpresso
# decide what you want to develop and how to inject that into wordpress installation
vim docker-compose.yml
# write any additional provisioning script for adding plugins etc.
vim Dockerpressofile
# quickly review the wp-config.php setup
vim .env
# install wordpress
sh dockerpresso init
# run it!
sh dockerpresso up
```

Open your Docker host name or ip in your browser. Fresh Wordpress installation
with your plugin or theme mounted in `wp-content` directory is ready to work on!

## Basic usage

After installation you can start with following command:

`sh dockerpresso init`

Which will download latest Wordpress installation and prepare it to work with Docker Compose configuration.

`sh dockerpresso up`

Which will start web and mysql services.
After launching it you should be able to complete Wordpress installation
process when opening in browser your Docker host name or ip.

## Installation

In your project root directory execute:

```docker run --rm -v `pwd`:/project michaloo/dockerpresso```

It will generate following files in your project root:

```
/dockerpresso
/docker-compose.yml
/docker-compose.admin.yml
Dockerpressofile
```

* `docker-compose.yml` contains base Docker configuration for two services
`web` and `mysql`.

* `docker-composer.admin.yml` contains configuration for two additional one-time
commands services `web-cli` and `mysql-cli`.

* `dockerpresso` is a bash script with simple shortcuts for most common commands.

Please edit `docker-compose.yml` to enable theme or plugin development.

