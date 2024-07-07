FROM ubuntu:24.04

ENV GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt-get update -y \
&& apt-get install sudo -y \
&& apt-get install iputils-ping -y \
&& apt-get install net-tools -y \
&& apt-get install make -y \
&& apt-get install binutils -y \
&& apt-get install build-essential -y \
&& apt-get install cpio -y \
&& apt-get install unzip -y \
&& apt-get install rsync -y \
&& apt-get install file -y \
&& apt-get install bc -y \
&& apt-get install wget -y \
&& apt-get install python3 -y \
&& apt-get install libncurses-dev -y \
&& apt-get install git -y \
&& apt-get install subversion -y \
&& apt-get install cvs -y \
&& apt-get install mercurial -y \
&& apt-get install ssh -y 

RUN useradd -m buildbot && echo "buildbot:1234" | chpasswd && adduser buildbot sudo
RUN mkdir -p /workdir && chown buildbot:buildbot /workdir

USER buildbot

WORKDIR /workdir
