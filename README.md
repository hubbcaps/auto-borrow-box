# autoplex

This is an Ansible Playbook used to deploy Plex, SabNZB, Couch Potato and Sonarr inside of Docker containers.

This playbook fully assumes Centos 7 as your target machine, as well as your ability to sudo up.

This playbook also assumes you are completely fine having Docker run as root and some of the apps running as root inside the containers.
While this isn't best practice, it does make setting it all up Just Work™.

Once the base container configuration is completed, I highly recommend following [this guide](http://www.totalhtpc.com/ultimate-usenet-guide.html) to setup the applications themselves.
