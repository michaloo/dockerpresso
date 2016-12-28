# Dockerpresso

Docker Compose configuration generator for fast Wordpress Theme or plugin development.

More information about reasons behind Dockerpresso are presented in [this blog post](https://medium.com/@michaloo/express-wordpress-theme-and-plugin-development-environment-e077d52535e0).

## Fast start

```
mkdir your-new-project
cd your-new-project
docker run --rm -v `pwd`:/project michaloo/dockerpresso
vim docker-compose.yml
bash dockerpresso init
vim .env
bash dockerpresso up
```

Open your Docker host name or ip in browser. Fresh Wordpress installation
with your plugin or theme mounted in `wp-content` directory is ready
to work on!

## Installation

In your project root directory execute:

```docker run --rm -v `pwd`:/project michaloo/dockerpresso```

It will generate following files in your project root:

```
/dockerpresso
/docker-compose.yml
/docker-compose.admin.yml
```

* `docker-compose.yml` contains base Docker configuration for two services
`web` and `mysql`.

* `docker-composer.admin.yml` contains configuration for two additional one-time
commands services `web-cli` and `mysql-cli`.

* `dockerpresso` is a bash script with simple shortcuts for most common commands.

Please edit `docker-compose.yml` to enable theme or plugin development.

## Basic usage

After installation you can start with following command:

`bash dockerpresso init`

Which will download latest Wordpress installation and prepare it to work with
Docker Compose configuration.
It will also create another file `.env` which will carry all configuration of
database and Wordpress. Please fill it and then run:

`bash dockerpresso up`

Which will start web and mysql services.
After launching it you should be able to complete Wordpress installation
process when opening in browser your Docker host name or ip.

## Components

Dockerpresso project base on following components:

* [michaloo/docker_wp-cli](https://github.com/michaloo/docker_wp-cli)
Docker image with WP-CLI tool installed which is a base image for dockerpresso.
All download and maintenance commands are done by WP-CLI.

* [michaloo/wp-cli-environmentalize](https://github.com/michaloo/wp-cli-environmentalize)
WP-CLI package which injects `getenv` into `wp-config.php` to make Wordpress
to work on ENV variables set for docker containers.
