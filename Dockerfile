# nodeschool

FROM debian:jessie

MAINTAINER Stephane Fret <fret.steph@gmail.com>
 
# Install nodejs
RUN apt-get update && apt-get install -y curl vim
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs build-essential 

# Install git
RUN apt-get install -y git-core
RUN adduser git

# add user nds
RUN adduser --disabled-password --gecos "Nodeschool user" nds

# Install nodeschool modules
RUN npm install -g javascripting

# Vim config
RUN sed -e "s/\"syntax on/syntax on/" /usr/share/vim/vimrc | sed -e "s/\"set showcmd/set showcmd/" | sed -e "s/\"set showmatch/set showmatch/" > /usr/share/vim/vimrc.tmp
RUN mv /usr/share/vim/vimrc.tmp /usr/share/vim/vimrc

# go to user and workdir
USER nds
WORKDIR /home/nds

RUN mkdir .config nodeschool

# .bashrc config
RUN sed -e "s/\#force_color_prompt=yes/force_color_prompt=yes/" ~/.bashrc > ~/.bashrc.tmp1
RUN sed -e "s/34m/36m/" ~/.bashrc.tmp1	> ~/.bashrc.tmp2
RUN sed -e "s/32m/34m/" ~/.bashrc.tmp2	> ~/.bashrc
RUN rm ~/.bashrc.tmp*

RUN echo "" >> ~/.bashrc
RUN echo "alias ll='ls -alh'" >> ~/.bashrc
RUN echo "alias l='ll'" >> ~/.bashrc
RUN echo "alias lrt='ls -alhrt'" >> ~/.bashrc
RUN echo "alias lt='lrt'" >> ~/.bashrc

