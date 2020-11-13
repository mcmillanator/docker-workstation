FROM alpine

WORKDIR /home
RUN apk add --no-cache \ 
  bash \
  curl \
  docker \
  docker-compose \
  fzf \
  git \
  go \
  make \
  openssh-client \
  perl \
  rsync \
  ruby \
  sudo \
  tmux \
  vim \
  wget \ 
  zsh-vcs \
  zsh
RUN gem install tmuxinator
#RUN git clone https://github.com/mcmillanator/dotfiles.git && \
#	cd dotfiles && \
#	./install.sh ; \
#	exit 0
ENV HOME /home
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
COPY files/home /home
RUN ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
VOLUME /home/.ssh
