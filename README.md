Repository for my custom [Fedora](https://fedoraproject.org) Atomic images using [Universal Blue's](https://universal-blue.org) images and their [image template](https://github.com/ublue-os/image-template) as a base. I build two images. One for my desktop ([bazzite](https://bazzite.gg)-dx-nvidia-gnome:stable), and one for my laptop ([bluefin](https://projectbluefin.io)-dx:stable).

Currently I make the following customizations for both images:
- I install [Trivalent](https://github.com/secureblue/Trivalent) from [Secureblue](https://secureblue.dev/) and confine it using SELinux (using the script found [here](https://github.com/AtiusAmy/trivalent-images))
   (this is an unsupported installation)
- I install webkit2gtk4.1 form Fedora's repos so that the [Lem](https://github.com/lem-project/lem) appimage will work
- I install [Niri](https://github.com/YaLTeR/niri) and [DMS](https://danklinux.com/) using the configs from [Zirconium](https://github.com/zirconium-dev/zirconium)
