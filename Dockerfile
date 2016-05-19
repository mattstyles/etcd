FROM alpine
MAINTAINER Matt Styles <matt@personalurban.com>

RUN apk update && \
    apk add curl

RUN curl -L  https://github.com/coreos/etcd/releases/download/v2.2.3/etcd-v2.2.3-linux-amd64.tar.gz -o etcd-v2.2.3-linux-amd64.tar.gz && \
    tar xzvf etcd-v2.2.3-linux-amd64.tar.gz

EXPOSE 2379 2380
WORKDIR /etcd-v2.2.3-linux-amd64

ENTRYPOINT exec ./etcd \
  -name etcd0 \
  -advertise-client-urls http://$HOST_IP:2379,http://$HOST_IP:4001 \
  -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
  -initial-advertise-peer-urls http://$HOST_IP:2380 \
  -listen-peer-urls http://0.0.0.0:2380 \
  -initial-cluster-token etcd-cluster-1 \
  -initial-cluster etcd0=http://$HOST_IP:2380 \
  -initial-cluster-state new
