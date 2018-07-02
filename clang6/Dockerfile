FROM ubuntu:18.04

ENV TERM xterm-256color
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# support for add-apt-repository and locale-gen
RUN apt-get update && apt-get install -y locales software-properties-common \
      && locale-gen en_US.UTF-8

WORKDIR /root

CMD ["/bin/bash"]

# neovim
RUN add-apt-repository ppa:neovim-ppa/stable \
      && apt-get update && apt-get install -y \
        curl \
        git \
        neovim \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip \
        silversearcher-ag \
      && pip install neovim -U \
      && pip3 install neovim -U \
# Plug
      && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# neovim plugins
ADD nvim /root/.config/nvim
RUN nvim --headless +PlugInstall +qa \
      && nvim --headless +UpdateRemotePlugins +qa
# clang6
RUN apt-get install -y \
        xz-utils \
        build-essential \
      && rm -rf /var/lib/apt/lists/* \
      && curl -SL http://releases.llvm.org/6.0.0/clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz \
      | tar -xJC . \
      && mv clang+llvm-6.0.0-x86_64-linux-gnu-ubuntu-16.04 clang_6.0.0 \
      && echo 'export PATH=/root/clang_6.0.0/bin:$PATH' >> ~/.bashrc \
      && echo 'export LD_LIBRARY_PATH=/root/clang_6.0.0/lib:LD_LIBRARY_PATH' >> ~/.bashrc
# cmake 3.11.4
RUN apt-get purge cmake \
      && curl -SL https://cmake.org/files/v3.11/cmake-3.11.4-Linux-x86_64.tar.gz \
      | tar xz \
      && cp -r cmake-3.11.4-Linux-x86_64/bin /usr/ \
      && cp -r cmake-3.11.4-Linux-x86_64/share /usr/ \
      && cp -r cmake-3.11.4-Linux-x86_64/doc /usr/share/ \
      && cp -r cmake-3.11.4-Linux-x86_64/man /usr/share/ \
      && rm -rf cmake-3.11.4-Linux-x86_64

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
