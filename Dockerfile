FROM multiarch/ubuntu-debootstrap:arm64-xenial
ENV PREFIX_DIR /usr/glibc-compat
ENV GLIBC_VERSION 2.23
ENV ARCH aarch64
RUN apt-get -q update \
	&& apt-get -qy install build-essential wget openssl gawk
COPY configparams /glibc-build/configparams
COPY builder /builder
ENTRYPOINT ["/builder"]
