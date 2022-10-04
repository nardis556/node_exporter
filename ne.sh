#!bin/bash

curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest \
| grep "browser_download_url.*linux-amd64.tar.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

tar xvfz node_exporter-*.*-amd64.tar.gz && mv node_exporter-*.*-amd64 node_exporter

(crontab -l 2>/dev/null; echo "@reboot cd node_exporter && ./node_exporter") | crontab -

cd node_exporter && ./node_exporter
