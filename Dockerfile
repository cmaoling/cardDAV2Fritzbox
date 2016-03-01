############################################################
# Dockerfile to create microserice for sync of Owncloud <> Fritzbox
FROM [user.id]/[parent.repository][parent.tag]
###########################################################
# File Author / Maintainer
MAINTAINER [user.name] "[user.email]"
################## BEGIN INSTALLATION ######################
ENV DEBIAN_FRONTEND noninteractive
RUN /bin/bash -c "apt-get update && apt-get upgrade -y && apt-get clean && apt-get autoremove"
RUN apt-get install -y php5-cli php5-curl git
# secure cloning based on http://stackoverflow.com/questions/23391839/clone-private-git-repo-with-dockerfile
# doing the plain path instead:
# Clone the conf files into the docker container
RUN git clone http://git@github.com/cmaoling/carddav2fb.git
ENV CONFIG /carddav2fb/config.example.php
VOLUME /config
