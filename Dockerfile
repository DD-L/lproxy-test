#FROM docker.io/busybox:latest
#FROM docker.io/textlab/ubuntu-essential:latest
FROM docker.io/deel/ubuntu-mydev:origin
MAINTAINER deel deel@d-l.top

RUN mkdir -p /opt/lproxy/bin \
			 /var/log/lproxy \
					 /lib64 \
	 /usr/lib/x86_64-linux-gnu/ \
	 /lib/x86_64-linux-gnu/

COPY ./lib/x86_64-linux-gnu/libpthread.so.0     /lib/x86_64-linux-gnu/libpthread.so.0
COPY ./lib/x86_64-linux-gnu/librt.so.1          /lib/x86_64-linux-gnu/librt.so.1
COPY ./usr/lib/x86_64-linux-gnu/libstdc++.so.6  /usr/lib/x86_64-linux-gnu/libstdc++.so.6
COPY ./lib/x86_64-linux-gnu/libm.so.6           /lib/x86_64-linux-gnu/libm.so.6
COPY ./lib/x86_64-linux-gnu/libgcc_s.so.1       /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY ./lib/x86_64-linux-gnu/libc.so.6           /lib/x86_64-linux-gnu/libc.so.6
COPY ./lib64/ld-linux-x86-64.so.2               /lib64/ld-linux-x86-64.so.2

COPY ./bin.tar /opt/lproxy/bin.tar

RUN   set -x \
	&& tar xvf /opt/lproxy/bin.tar -C /opt/lproxy \
	&& rm -rf /opt/lproxy/bin.tar \
	&& set +x

WORKDIR /opt/lproxy/bin
