############################################################
# Dockerfile to create microserice for sync of Owncloud <> Fritzbox
# Based on armhf-debian
FROM mazzolino/armhf-ubuntu:14.04

###########################################################
# File Author / Maintainer
MAINTAINER Colinas Maoling "colinas.maoling@t-online.de"
################## BEGIN INSTALLATION ######################
# Install APACHE2 on micro best of my knowledge
RUN /bin/bash -c "apt-get update && apt-get upgrade -y && apt-get clean && apt-get autoremove"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y php5-cli php5-curl git
# enable cloning based on http://stackoverflow.com/questions/23391839/clone-private-git-repo-with-dockerfile
RUN mkdir /root/.ssh/
# Copy over private key, and set permissions
ADD id_rsa /root/.ssh/id_rsa
# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
# Clone the conf files into the docker container
RUN git clone git@github.com:cmaoling/carddav2fb.git /php

