FROM centos:latest

RUN yum install -y ncurses-devel.x86_64 git make

WORKDIR /root
RUN git clone https://github.com/vim/vim.git
RUN yum install -y gcc
RUN	cd vim/src && \
		make && \
		make install && \
		cd /root && \
		rm -rf /root/vim

FROM centos:latest
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
		chmod +x /usr/local/bin/docker-compose

FROM centos:latest

COPY --from=0 /usr/local/bin/vim /usr/local/bin/vim
COPY --from=0 /usr/local/share/vim /usr/local/share/vim
COPY --from=1 /usr/bin/docker /usr/bin/docker
COPY --from=1 /usr/local/bin/docker-compose /usr/local/bin/docker-compose
WORKDIR /root
RUN git clone https://github.com/mcmillanator/dotfiles.git && \
	cd dotfiles && \
	./install.sh ; \
	exit 0
RUN yum install -y git jq ncurses openssh-clients rsync tmux zsh
#RUN yum groupinstall -y 'Development Tools' --skip-broken
