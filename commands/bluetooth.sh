sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
systemctl status bluetooth.service

rfkill list
sudo rfkill unblock bluetooth
sudo hciconfig hci0 up

bluetoothctl
scan on
pair MAC_ADDR
connect MAC_ADDR

# E5:BB:B7:45:5D:CC
# 38:18:4C:4A:E9:D5
