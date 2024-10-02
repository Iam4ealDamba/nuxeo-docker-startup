# Image
FROM ubuntu:22.04

# Working directory
WORKDIR /opt

# Nuxeo Assets
COPY ./assets .

# Install Nuxeo
RUN apt update
RUN apt upgrade
RUN apt install -y wget curl unzip imagemagick
RUN apt install -y dcraw poppler-utils
RUN apt install -y libreoffice ffmpeg
RUN apt install -y libwpd-tools ghostscript
RUN apt install -y libimage-exiftool-perl
RUN apt install -y openjdk-11-jdk openjdk-11-jre
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN . ~/.nvm/nvm.sh 
RUN mkdir client
RUN mkdir server
RUN unzip nuxeo-server-tomcat-2021.1.zip
RUN rm nuxeo-server-tomcat-2021.1.zip
RUN mv nuxeo-server-tomcat-2021.1 nuxeo 

# Start Nuxeo
CMD ["/bin/bash"]

# Exposed ports
EXPOSE 8080