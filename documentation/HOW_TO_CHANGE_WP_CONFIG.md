# How to change variables in wp-config.php file?

Since we are in docker based envrionment the main way to configure application are envrionmental variables.
They are all stores in `.env` file.

If you need to change something just edit `.env` file and restart containers using following command:

`dockerpresso up`