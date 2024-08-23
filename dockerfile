FROM ubuntu:22.04
RUN apt-get update -yq && apt-get upgrade -yq
RUN apt-get install strongswan strongswan-pki libcharon-extra-plugins libcharon-extauth-plugins libstrongswan-extra-plugins libtss2-tcti-tabrmd0 -y
RUN apt-get install iptables -y
COPY ./etc/ipsec.conf /etc/ipsec.conf
COPY ./etc/ipsec.secrets /etc/ipsec.secrets
COPY ./etc/ipsec.d/cacerts/ca-cert.pem /etc/ipsec.d/cacerts/ca-cert.pem
COPY ./etc/ipsec.d/certs/server-cert.pem /etc/ipsec.d/certs/server-cert.pem
COPY ./etc/ipsec.d/private/ca-key.pem /etc/ipsec.d/private/ca-key.pem
COPY ./etc/ipsec.d/private/server-key.pem /etc/ipsec.d/private/server-key.pem
CMD /usr/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 10.10.10.0/24 -j MASQUERADE; /usr/sbin/ipsec start --nofork
