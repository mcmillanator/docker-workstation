FROM alpine

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
RUN gem install tmuxinator
#RUN git clone https://github.com/mcmillanator/dotfiles.git && \
#	cd dotfiles && \
#	./install.sh ; \
#	exit 0
VOLUME /home
COPY files/home /home
RUN chmod 777 -R /home
