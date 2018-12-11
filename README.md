# docker_scripts
Scripts for creating and starting docker containers running Moodle.

Where to start:-

-  You need to create your docker image to run your container, for setting up a LAMP docker image you can use my LAMP setup script https://github.com/JamieBiddulph/lamp_setup
-  Within your docker image, add the script updatemdlconf.sh into /var/opt making sure to keep the same name, and set permissions to 775 (chmod 775 /var/opt/updatemdlconf.sh). This is to update the IP address of the moodle config on creation of the container, and each restart when using start_docker.sh
- On the docker host clone the file docker_container.sh and run as a script, follow the prompts and you should have a running container.
- If your container gets stopped and requires a restart, you can use the start_docker.sh script to start it again, this will also update the moodle config.php with the new IP address of the container.
