pactl info
sudo pacman -S pipewire pipewire-alsa wireplumber pipewire-pulse
sudo pacman -Rns pulseaudio
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire pipewire-pulse wireplumber
pactl list sinks
pactl set-default-sink 210
