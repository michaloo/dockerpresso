# CHANGELOG

## v2.1.0

**REQUIRES MIGRATION (see below)**

Couple more significant enhancements:

- rolled back to use local directory for Wordpress files 🤦
    It's just too convenient to have easy access to any Wordpress file in code editor, even if it seems like antipattern, but ease of development is primary goal of dockerpresso.
    Wordpress files will be now available in `wordpress_directory`.
- this resolved a problem cause by trying to download Wordpress on every `up`
- added `WORDPRESS_VERSION` env variable to control which version of Wordpress is used
- updated and improved overall documentation

**MIGRATION**

Existing projects should be rebuild by running following commands.
**THIS WILL OVERWRITE all dockerpresso files and custom changes needs manual porting.**

```sh
# make sure latest version of dockerpresso is installed
dockerpresso destroy
dockerpresso init
# edit docker-compose.yml and optionally other files since they were just overwritten
dockerpresso up
```

## v2.0.2

Smaller improvements

- don't mount volume to local directory - which can be changed breaking some commands
- add this changelog file

## v2.0.1

Hotfix for broken comment.


## v2.0.0

This release simplifies dockerpresso:

- no other dependencies than bash
- dockerpresso is supposed to be installed in /usr/local/bin or similar place instead of in each project
- no separate templates files, everything is in one bash script
- no custom docker images or installers, I know I already wrote that, but this is just a single bash script now
- commands simplified and reworked for easier usage
- documentation slightly updated


## v0.0.1

Initial version
