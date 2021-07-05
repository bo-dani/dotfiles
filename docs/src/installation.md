# Installation

## Arch

Follow official [wiki](https://wiki.archlinux.org/title/Installation_guide).

## Manjaro

Follow installation guide provided in the live installation media.

### Drivers

With Manjaro everything should be up and running out of the box. However, in an HP laptop I found that the wireless interface wasn't showing up.

#### WiFi

If no wireless card is detected when running:

```sh
$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```

Follow this [tutorial](https://archived.forum.manjaro.org/t/realtek-wifi-driver-installation-aur/85429).
