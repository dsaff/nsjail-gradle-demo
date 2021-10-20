FROM ubuntu:18.04

RUN apt-get -y update && apt-get install -y \
    autoconf \
    bison \
    flex \
    gcc \
    g++ \
    git \
    libprotobuf-dev \
    libnl-route-3-dev \
    libtool \
    make \
    pkg-config \
    protobuf-compiler \
    openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

RUN cd / && git clone https://github.com/google/nsjail.git
RUN cd /nsjail && make && mv /nsjail/nsjail /bin && rm -rf -- /nsjail

COPY . /minimal-gradle

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN export JAVA_HOME

# cache gradle zip, because we won't be able to grab it offline
RUN cd /minimal-gradle; ./gradlew tasks