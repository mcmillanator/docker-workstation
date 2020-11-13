FROM alpine

WORKDIR /home
RUN apk add --no-cache \ 
  curl \
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
ENV HOME /home
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
COPY files/home /home
