# How to import existing Wordpress site to work on it locally?

This guide will show you how to import data from your existing Wordpress site in order
to develop your plugin or theme in production like environment.

This guide assumes you have access to `ssh` and `wp-cli` on your production server.

## Preparation

Make sure that you have initialized dockerpresso in your project directory.

```sh
dockepresso init
```

## Export existing Wordpress site files

If your website is relatively small you can just run following command to pack everything
into one `tgz` file:

```sh
tar --exclude='wp-config.php' -zcvf ../wordpress_files.tgz .
```

Alternatively if your Wordpress instance contains lots of media files which you don't need for development
and downloading them would be too time-consuming, we will create two separate files to copy over (we assume that media files are in `wp-content/uploads` directory - if not, adjust it in commands below).

First, let's create a file containing all Wordpress data without media files:

```sh
tar --exclude='wp-config.php' --exclude='wp-content/uploads' -zcvf ../wordpress_files.tgz .`
```

Then, let's prepare a second file which will contain media files but just from last 7 days:

```sh
find wp-content/uploads -type f -mtime -7 | xargs tar -zc vf ../wordpress_uploads.tgz
```

## Export existing Wordpress database

Since we have ssh access to wp-cli exporting database is just this one liner:

```sh
wp db export
```

This will create a new sql file.

## Copy all create files from server

You know how to do it :) Please use sftp, scp or any other tool to copy over files created in previous steps to your local machine.

## Importing Wordpress files into Dockerpresso instance

Now let's extract those files locally into `wordpress_data` directory:


```sh
tar zxvf wordpress_files.tgz -C ./wordpress_data/

# run this command only if you separated the extracts in previous steps
tar zxvf wordpress_uploads.tgz -C ./wordpress_data/
```


## Import Wordpress database into Dockerpresso instance

The easiest way of getting the sql import would be to move the sql dump into the wordpress_data directory and use wp-cli to import it.

```sh
mv wordpress_database.sql ./wordpress_data
dockerpresso cli
wp db import wordpress_database.sql
```

## Post-import adjustments

After your Wordpress instance is moved, you probably want to adjust it slightly to make it work on your local instance.

You may want to replace the urls using wp-cli search-replace tool:

```sh
dockerpresso cli
wp search-replace 'website.com' 'localhost'
```


Also, you may want to change password for admin account for quicker logins:

```sh
dockerpresso cli
wp user update user_name --user_pass=test
```
