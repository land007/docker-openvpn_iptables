FROM land007/openvpn:latest

#RUN apt-get update && apt-get install -y iptables && apt-get clean
RUN apk add --update curl iptables && \
    rm -rf /var/cache/apk/*
ENV LANIP=172.18.0.1
ADD iptables.sh	/
RUN chmod +x /iptables.sh

#CMD ["ovpn_run"]
CMD /iptables.sh ; ovpn_run

#docker build -t land007/openvpn_iptables:latest .
#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/openvpn_iptables:latest --push .
