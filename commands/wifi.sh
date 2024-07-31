nmcli dev status
nmcli radio wifi
nmcli radio wifi on
nmcli dev wifi list
sudo nmcli dev wifi connect "SSID" password "PWD"
nmcli dev set wlp1s0 autoconnect yes

sudo iw dev wlp1s0 link
