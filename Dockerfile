# copied from https://github.com/theia-ide/theia-apps/blob/master/theia-docker/Dockerfile
# modified here
ARG NODE_VERSION=12.18.3
FROM node:${NODE_VERSION}-alpine AS builder
RUN apk add --no-cache \
    gcc \
    g++ \
    libx11-dev \
    libxkbfile-dev \
    libsecret-dev \
    make \
    pkgconfig \
    python \
    ;
ARG version=latest
WORKDIR /home/theia
ADD files/theia/package.json /home/theia/package.json
RUN yarn --pure-lockfile && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build && \
    yarn theia download:plugins && \
    yarn --production && \
    yarn autoclean --init && \
    echo *.ts >> .yarnclean && \
    echo *.ts.map >> .yarnclean && \
    echo *.spec.* >> .yarnclean && \
    yarn autoclean --force && \
    yarn cache clean

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
  g++ \
  lsblk \
  make \
  nodejs \
  openssh-client \
  perl \
  rsync \
  ruby \
  sudo \
  the_silver_searcher \
  tmux \
  vim \
  wget \ 
  yarn \
  zsh-vcs \
  zsh
RUN gem install tmuxinator
ENV HOME /home
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
COPY files/home /home
RUN ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
COPY --from=builder /home/theia /home/theia
WORKDIR /home/theia
ENV THEIA_DEFAULT_PLUGINS local-dir:/home/theia/plugins
ENTRYPOINT [ "node", "/home/theia/src-gen/backend/main.js", "/app", "--hostname=0.0.0.0" ]
