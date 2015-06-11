FROM debian:wheezy

ENV CONSUL_TEMPLATE_VERSION 0.10.0

RUN apt-get update && apt-get install wget \
    && wget -O /tmp/ct.tar.gz https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz \
    && tar -xf /tmp/ct.tar.gz -C /tmp \
    && mv /tmp/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64/consul-template /usr/local/bin/ \
    && rm -rf /tmp/ct.tar.gz /tmp/consul-template* \
    && wget -O /usr/local/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.6.0 \
    && chmod +x /usr/local/bin/docker /usr/local/bin/consul-template \
    && apt-get remove --purge -y wget \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["/usr/local/bin/consul-template"]