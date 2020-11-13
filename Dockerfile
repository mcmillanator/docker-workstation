FROM alpine

COPY ./files/etc/sudoers /etc/sudoers

WORKDIR /home
RUN apk add --no-cache \ 
  docker \
  docker-compose \
  git \
  make \
  openssh-client \
  perl \
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
VOLUME /home
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
COPY files/etc /
COPY files/home /home
RUN chmod 777 -R /home
