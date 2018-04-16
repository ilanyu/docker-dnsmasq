# docker-dnsmasq
docker-dnsmasq

# Use:

	docker pull ilanyu/dnsmasq

	docker run --restart=always -d --name dnsmasq -p 53:53 -p 53:53/udp -e "DNSMASQ_DNS_SERVER=114.114.114.114" ilanyu/dnsmasq

