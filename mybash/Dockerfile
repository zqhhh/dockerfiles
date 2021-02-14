FROM bash
RUN apk add --no-cache curl gawk tzdata grep git gcc make libc6-compat libc-dev
ENV TZ Asia/Shanghai

RUN git clone https://github.com/wolfcw/libfaketime.git
WORKDIR /libfaketime/src
RUN make install

WORKDIR /root