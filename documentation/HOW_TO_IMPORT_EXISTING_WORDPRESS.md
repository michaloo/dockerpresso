# How to import existing Wordpress site to work on it locally?

This guide will show you how to import data from your existing Wordpress site in order
to develop your plugin or theme in production like environment.

This guide assumes you have access to `ssh` and `wp-cli` on your production server.

## Preparation

Make sure that you have
First we will make sure that the volume exists:

```sh
dockepresso up
```

## Export existing Wordpress site files

If your website is relatively small you can just run following command to pack everything
into one compressed file:

```sh
tar --exclude='wp-config.php' -zcvf ../wordpress_files.tgz .
```

Alternatively if your Wordpress instace contains lots of media files which you don't need for development
and downloading them would be an unnecesary effort, then we will create two separate files to copy over (we assume that media files are in default `wp-content/uploads` directory - if not adjust it in commands below)

First file containing all Wordpress data without media files:

```sh
tar --exclude='wp-config.php' --exclude='wp-content/uploads' -zcvf ../wordpress_files.tgz .`
```

Second file which will contain media files but just from last 7 days:

```sh
find wp-content/uploads -type f -mtime -7 | xargs tar -zc vf ../wordpress_uploads.tgz
```

## Export existing Wordpress database

Since we have ssh access to wp-cli exporting database is just this one liner:

```sh
wp db export
```

This will create a new sql file.


## Importing Wordpress files into Dockerpresso instance

Now let's extract those files locally into one `wordpress_data` directory:


```sh
mkdir wordpress_data
tar zxvf wordpress_files.tgz -C ./wordpress_data/
# run this command only if you separated the extracts above
tar zxvf wordpress_uploads.tgz -C ./wordpress_data/
```

Then, let's copy them over to our docker volume.
We will use native docker function `cp` to copy over files:

```sh
docker cp wordpress_data/* $(docker-compose $ALL_DC_FILES ps -q web):/var/www/html
```


We can now start both http and mysql servers:

`sh dockerpresso up`

Now the easiest way of getting the sql import would be to move the sql dump into the wordpress_data directory and use wp-cli to import it.

`mv wordpress_database.sql ./wordpress_data`

`sh dockerpresso`

`wp db import wordpress_database.sql`



and as a last step you probably want to rewrite urls from the production instance to local urls.

`wp search-replace 'website.com' 'website.local'`


you may also set other password:

`wp user update user_name --user_pass=test`


if you are using jetpack