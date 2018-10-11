# auto-borrow-box

This is an Ansible Playbook used to install Docker and needed packages, and then deploy [Plex](https://hub.docker.com/r/plexinc/pms-docker/), [Ubooquity](https://github.com/linuxserver/ubooquity), [SabNZB](https://hub.docker.com/r/linuxserver/sabnzbd/), [NZBHydra](https://hub.docker.com/r/linuxserver/hydra/), [Mylar](https://hub.docker.com/r/linuxserver/mylar/), [Lazy Librarian](https://hub.docker.com/r/linuxserver/lazylibrarian/), [Radarr](https://hub.docker.com/r/linuxserver/radarr/), and [Sonarr](https://hub.docker.com/r/linuxserver/sonarr/) and [Manage this node](https://github.com/onedr0p/manage-this-node) inside of Docker containers.


## Features

* Works with Centos 7 and Ubuntu 16.04.

* Easily choose what containers to install

## TL;DR

Setup:

- A user on the remote system to own your media directories and own the docker containers
- Edit the group_vars/all file to your liking

Deploy:

`ansible-playbook site.yml -k -K --extra-vars "user=<your remote user> target=<your target host group>"`

## Breakdown

Before deploying this, you should look through each of the above docker READMEs and verify the settings in them and the playbooks here work for your needs and setup.

At the VERY LEAST, go through the group_vars/all file and edit the paths to your liking.

This playbook fully assumes your ability to sudo up to install packages and open up the required ports. On Ubuntu it will turn your firewall on if it isn't already. Modify as you like.

Things you should be aware of before configuring the playbooks to work with your setup:

In groupvars/all, you will find the base paths most of the playbooks will assume you have setup. You should change these to match how you want them deployed on your host system or make the folders on your docker host to match the playbooks.

For example on my system I have mounted 2 NFS mounts to two seperate paths, /storage and /media

/storage is where I mount the application configuration volumes, this makes it easy to edit configs on the command line if you wish from the host system without having to enter into the container.

/media is where I've created all of the folders necessary for the applications post processing and where the media they borrow will eventually live.

Make sure to carefully look over how each of the roles use the base paths and conjoin them with their mounted volumes so you know what you want to select when actually setting up the applications after deployment.

You should also create a user on your server purely for running these docker containers, for example docker-runner, and then replace the UID GID variables with it's IDs on the system. Make sure the directories from above are owned by the same user id/group id you specify in the group_vars/all file so there isn't any permission issues with your volumes inside the containers.

Once the base container configuration is completed, I highly recommend following [this guide](https://www.cuttingcords.com/home/ultimate-server/newsgroups-and-sabnzbd) to setup some of the applications themselves. Their guide is windows specific, however the application setup portion is the same and it's quite helpful if it's your first time configuring these types of applications. After their inital walk through you should have enough baseline knowledge to continue setting up the rest of the applications.

Troubleshooting tips:

With the configuration of each container, it's pushing all of it's logs into the hosts /var/log/messages so that should be the first place to check when something appears to not be working correctly.

This can be modified to taste to point at almost any logging mechanism you can desire. Docker is pretty flexible with this.

On CentOS, you may need to tweak SELinux, otherwise you may have issues with how some of the containers operate.

### Deploy

`ansible-playbook site.yml -k -K --extra-vars "user=<your remote user> target=<your target host group>"`
