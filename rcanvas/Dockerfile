FROM clang6

RUN git clone https://github.com/oktal/pistache.git \
      && cd pistache \
      && git submodule update --init \
      && mkdir build \
      && cd build \
      && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. \
      && make \
      && make install
