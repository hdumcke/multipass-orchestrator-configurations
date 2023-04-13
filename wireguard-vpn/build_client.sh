#!/bin/bash

sudo apt update
sudo apt install -y wireguard

wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey

# allow ipv4 forwarding
sudo sed -i "s/#net.ipv4.ip_forward/net.ipv4.ip_forward/" /etc/sysctl.conf

cat > /tmp/wg0.conf << EOF
[Interface]
PrivateKey = $(sudo cat /etc/wireguard/privatekey)
Address = 10.0.0.2/24

[Peer]
PublicKey = $SERVERKEY
AllowedIPs = 10.0.0.0/24
Endpoint = $SERVERIP.1:51820
EOF

sudo cp /tmp/wg0.conf /etc/wireguard/

sudo chmod 600 /etc/wireguard/{privatekey,wg0.conf}

cat > ~/connect.sh << EOF
#!/bin/bash

export SERVERKEY=
export SERVERIP=
sudo wg-quick up wg0
EOF

chmod +x ~/connect.sh
