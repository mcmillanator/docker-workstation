FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl git make gcc libncurses5-dev

WORKDIR /root
RUN git clone https://github.com/vim/vim.git && \
    cd vim/src && \
		make && \
		make install && \
		rm -rf /root/vim

FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
		chmod +x /usr/local/bin/docker-compose

FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
  autoconf \ 
  automake \
  build-essential \ 
  git \
  libffi-dev \
  libssl-dev \
	rsync \
	tmux \
  wget \
  zlib1g-dev \ 
	zsh

COPY --from=0 /usr/local/bin/vim /usr/local/bin/vim
COPY --from=0 /usr/local/share/vim /usr/local/share/vim
COPY --from=1 /usr/bin/docker /usr/bin/docker
COPY --from=1 /usr/local/bin/docker-compose /usr/local/bin/docker-compose
WORKDIR /root
RUN git clone https://github.com/mcmillanator/dotfiles.git && \
	cd dotfiles && \
	./install.sh ; \
	exit 0

RUN echo "America/New_York" > /etc/timezone
WORKDIR /tmp
RUN wget https://az764295.vo.msecnd.net/stable/fcac248b077b55bae4ba5bab613fd6e9156c2f0c/code_1.51.0-1604600753_amd64.deb
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN echo "tzdata tzdata/Areas select US\n tzdata tzdata/Zones/US select Eastern" > /tmp/preseed.txt
RUN debconf-set-selections /tmp/preseed.txt
RUN apt install -y ./code_1.51.0-1604600753_amd64.deb
RUN apt install -y libx11-xcb1 libxcb-dri3-0 libasound2
RUN apt install -y vim-gtk
