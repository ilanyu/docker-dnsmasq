FROM alpine:latest

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN apk --update --no-cache add dnsmasq ca-certificates

COPY gfwlist2dnsmasq /usr/local/bin/gfwlist2dnsmasq

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod a+x /usr/local/bin/gfwlist2dnsmasq && \
    chmod a+x /entrypoint.sh

EXPOSE 53 53/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["dnsmasq", "-d"]
