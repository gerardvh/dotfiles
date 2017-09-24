FROM ubuntu:16.04

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# Bootstrapping packages needed for installation
RUN \
  apt-get update && \
  apt-get install -yqq \
    locales \
    lsb-release \
    software-properties-common && \
  apt-get clean

# Set locale to UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  /usr/sbin/update-locale LANG=$LANG

# Install dependencies
# `universe` is needed for ruby
# `security` is needed for fontconfig and fc-cache
RUN \
  add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe security" && \
  add-apt-repository ppa:aacebedo/fasd && \
  apt-get update && \
  apt-get -yqq install \
    autoconf \
    build-essential \
    curl \
    fasd \
    fontconfig \
    git \
    python \
    python-setuptools \
    python-dev \
    ruby-full \
    sudo \
    tmux \
    vim \
    wget \
    zsh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make a user
RUN useradd --create-home -s /bin/zsh gerardvh

# Install this folder to user home dir
WORKDIR /home/gerardvh
COPY . ./.dotfiles
RUN chown -R gerardvh:gerardvh ./.dotfiles
USER gerardvh

# Install Homebrew
RUN git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew &&\
  PATH="$HOME/.linuxbrew/bin:$PATH" && \
  export MANPATH="$(brew --prefix)/share/man:$MANPATH" && \
  export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

# Add linuxbrew to path for Dockerfile
ENV PATH /home/gerardvh/.linuxbrew/bin:$PATH

# Run install scripts as my user
RUN ["/bin/zsh", "-c", "./.dotfiles/script/bootstrap"]
RUN ["/bin/zsh", "-c", "./.dotfiles/script/install"]
RUN ["/bin/zsh", "-c", "./.dotfiles/bin/dot"]
# RUN ["/bin/zsh", "-c", "echo $PATH"]

# Run a bash session
CMD [ "/bin/zsh" ]
