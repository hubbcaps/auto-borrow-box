# auto-borrow-box

This is an Ansible Playbook used to deploy [Plex](https://hub.docker.com/r/plexinc/pms-docker/), [Ubooquity](https://hub.docker.com/r/linuxserver/ubooquity/), [SabNZB](https://hub.docker.com/r/linuxserver/sabnzbd/), [NZBHydra](https://hub.docker.com/r/linuxserver/hydra/), [Ombi](https://hub.docker.com/r/linuxserver/ombi/), [Mylar](https://hub.docker.com/r/linuxserver/mylar/), [Lazy Librarian](https://hub.docker.com/r/linuxserver/lazylibrarian/), [Radarr](https://hub.docker.com/r/linuxserver/radarr/), and [Sonarr](https://hub.docker.com/r/linuxserver/sonarr/) inside of Docker containers.

Before deploying this, you should look through each of the above docker READMEs and verify the settings in them and the playbooks here work for your needs and setup.

This playbook fully assumes Centos 7 as your target machine, as well as your ability to sudo up to open up the required ports in firewalld.

Things you should be aware of before configuring the playbooks to work with your setup:

In groupvars/all, you will find the base paths most of the playbooks will assume you have setup. You should change these to match how you want them deployed on your host system or make the folders on your docker host to match the playbooks.

For example on my system I have mounted 2 ISCSI LUNs(fancier NFS) to two seperate paths, /storage and /media

/storage is where I mount the application configuration volumes, this makes it easy to edit configs on the command line if you wish from the host system without having to enter into the container.

/media is where I've created all of the folders necessary for the applications post processing and where they will eventually live.

Make sure to carefully look over how each of the roles use the base paths and conjoin them with their mounted volumes so you know what you want to select when actually setting up the applications after deployment.

You should also create a user on your server purely for running these docker containers, for example docker-runner, and then replace the UID GID variables with it's IDs on the system. Make sure the directories from above are owned by the same user so there isn't any permission issues with your volumes inside the containers.

Once the base container configuration is completed, I highly recommend following [this guide](https://www.cuttingcords.com/home/ultimate-server/newsgroups-and-sabnzbd) to setup some of the applications themselves. Their guide is windows specific, however the application setup portion is the same and it's quite helpful if it's your first time configuring these types of applications. After their inital walk through you should have enough baseline knowledge to continue setting up the rest of the applications.

Troubleshooting tips:

With the configuration of each container, it's pushing all of it's logs into the hosts /var/log/messages so that should be the first place to check when something appears to not be working correctly.

SELinux set to Permissive is the recommended setup, otherwise you may have issues with how some of the containers operate.
