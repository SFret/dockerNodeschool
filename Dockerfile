# nodeschool

FROM debian:jessie

MAINTAINER Stephane Fret <fret.steph@gmail.com>
 
# Install nodejs
RUN apt-get update && apt-get install -y curl vim
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs build-essential 

# Install git
RUN apt-get install -y git-core
RUN adduser --disabled-password --gecos "git user" git

# add user nds
RUN adduser --disabled-password --gecos "Nodeschool user" nds

# Install nodeschool modules
RUN npm install -g javascripting
RUN npm install -g learnyounode
RUN npm install -g git-it
RUN npm install -g how-to-npm
RUN npm install -g scope-chains-closures
RUN npm install -g stream-adventure

RUN npm install -g functional-javascript-workshop
RUN npm install -g shader-school
RUN npm install -g levelmeup
RUN npm install -g bytewiser
RUN npm install -g expressworks
RUN npm install -g bug-clinic
RUN npm install -g makemehapi
RUN npm install -g browserify-adventure
RUN npm install -g promise-it-wont-hurt
RUN npm install -g introtowebgl
RUN npm install -g async-you
RUN npm install -g count-to-6
RUN npm install -g nodebot-workshop
RUN npm install -g kick-off-koa
RUN npm install -g goingnative
RUN npm install -g lololodash
RUN npm install -g planetproto
RUN npm install -g learnyoucouchdb
RUN npm install -g webgl-workshop
RUN git clone https://github.com/thlorenz/learnuv.git && cd learnuv && npm install
RUN npm install -g esnext-generation
RUN npm install -g learn-generators
RUN npm install -g test-anything
RUN npm install -g learnyoureact
RUN npm install tower-of-babel -g
RUN npm install -g perfschool
RUN npm install -g web-audio-school

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

