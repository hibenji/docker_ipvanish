FROM ubuntu:20.04

MAINTAINER Benjamin Bordne <benjibordne@outlook.com>


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget \
    unzip \
    network-manager-openvpn

ARG VPN_DIR=/etc/openvpn

WORKDIR ${VPN_DIR}

RUN wget https://configs.ipvanish.com/configs/configs.zip && \
    unzip configs.zip

COPY openvpn.sh openvpn.sh

ENV REGION='ipvanish-US-Seattle-sea-a01'
ENV USERNAME=''
ENV PASSWORD=''

CMD sh openvpn.sh
