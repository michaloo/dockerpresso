# How to import existing Wordpress site?

## Mount Dockerpresso Wordpress data to your project directory

**Ignore it in .gitignore.**


## Export existing Wordpress site files

`tar --exclude='wp-config.php' --exclude='wp-content/uploads' -zcvf ../wordpress_files.tgz .`

`find wp-content/uploads -type f -mtime -7 | xargs tar -zc vf ../wordpress_uploads.tgz`

```sh
wp db export
```

Now let's bring those files to your local directory where your project is


```sh
mkdir wordpress_data
tar zxvf wordpress_files.tgz -C ./wordpress_data/
tar zxvf wordpress_uploads.tgz -C ./wordpress_data/
```

Once files are extracted we can generate wp-config.php file:

`sh dockerpresso init --skip-download`

then please review .env file to see if you want to adjust any settings/

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