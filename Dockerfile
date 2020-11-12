FROM alpine

COPY ./files/etc/sudoers /etc/sudoers

WORKDIR /root
RUN apk add --no-cache \ 
  docker \
  docker-compose \
  git \
  make \
  rsync \
  ruby \
  sudo \
  tmux \
  vim \
  wget \
  zsh
#RUN git clone https://github.com/mcmillanator/dotfiles.git && \
#	cd dotfiles && \
#	./install.sh ; \
#	exit 0
RUN apk add --no-cache openssh-client perl
