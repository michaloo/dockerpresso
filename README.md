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

# run it!
dockerpresso up
```

Open your Docker host name or ip in your browser. Fresh Wordpress installation
with your plugin or theme mounted in `wp-content` directory is ready to work on!

## Quick overview

### Installation

Dockerpresso is simple sh script. It requires `sh`, `docker` and `docker-compose` to run.

You can install it with following one-liner to put it in `/usr/local/bin`:

`curl -O https://raw.githubusercontent.com/michaloo/dockerpresso/master/bin/dockerpresso && chmod +x dockerpresso && mv dockerpresso /usr/local/bin`

### Initialization

Once `dockepresso` is installed start by initializing your project:

```sh
dockerpresso init
```

It will generate following files in your project root:

```sh
.env
/docker-compose.yml
/docker-compose.admin.yml
Dockerpressofile
wordpress_data
```

**`.env`**

Contains environmental variables which controls your docker setup and `wp-config.php`.
Defaults should work in most cases, but you may want to review it to adjust to your project needs.

**`docker-compose.yml`**

Base docker-compose configuration for two services - `web` (php and apache) and `mysql`.
This is **key file to edit** and define how your project will be injected in Wordpress installation.
It comes with examples how to mount theme or plugin. Depending on what your project is you will mount it
to `/var/www/html/wp-content/themes` or `/var/www/html/wp-content/plugins` inside docker container.

**`docker-composer.admin.yml`**

Contains configuration for two additional one-time commands services `web-cli` and `mysql-cli`.
They allow to execute wp-cli commands (managing Wordpress via command line) and run SQL queries.
This file should not require any edits.

**`Dockerpressofile`**

This is a script where wp-cli can be used to prepare Wordpress installation for your project.
This is best place to install required plugins (imagine you are writing WooCommerce plugin, then install and activate WooCommerce here).
You can use `dockerpresso cli` to run those command manually before writing this script.
Editing this file is optional.

**`wordpress_data`**

This is directory exposing all Wordpress files from inside the container.
It's a little antipattern thing actually but it's here for convienence.
You should consider it as a ephemeral directory where files can be overwriten at any time and are managed by other places such as `Dockerpressofile`, but it may be very handy to open in your code editor (IDE) other plugins, themes or core wordpress files.
**This directory should not be renamed or commited into git repository!**


### Starting up

`dockerpresso up`

Which will start `web` and `mysql` services, make sure that `wp-config.php` is present and correct.
Then it will run script from `Dockerpressofile` which by default just installs Wordpress.

Every time this command it run it will recreate docker containers making sure current


## Guides

- [How to change things in wp-config.php?](./documentation/HOW_TO_CHANGE_WP_CONFIG.md)
- [How to import existing Wordpress?](./documentation/HOW_TO_IMPORT_EXISTING_WORDPRESS.md)
