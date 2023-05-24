```bash
# Run this first
cat >> /etc/udev/rules.d/95-monitor-hotplug.rules <<EOF
KERNEL=="card0", \
ACTION=="change", \
SUBSYSTEM=="drm", \
ENV{DISPLAY}=":0", \
ENV{XAUTHORITY}="/home/felix/.Xauthority", \
RUN+="/home/thuytv/.dotfiles/i3/hotplug.sh"
EOF
```
