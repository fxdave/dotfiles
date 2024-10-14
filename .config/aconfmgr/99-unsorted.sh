# Packages

IgnorePath /boot/initramfs-linux-fallback.img
IgnorePath /boot/initramfs-linux.img
IgnorePath /boot/intel-ucode.img
IgnorePath /boot/vmlinuz-linux
IgnorePath /efi
IgnorePath /etc/.pwd.lock
IgnorePath /etc/.updated
IgnorePath /etc/ca-certificates
IgnorePath /etc/fonts/conf.d/
IgnorePath /etc/group
IgnorePath /etc/group-
IgnorePath /etc/gshadow
IgnorePath /etc/gshadow-
IgnorePath /etc/ld.so.cache
IgnorePath /etc/machine-id
IgnorePath /etc/mkinitcpio.d/linux.preset
IgnorePath /etc/pacman.d/gnupg
IgnorePath /etc/pacman.d/mirrorlist
IgnorePath /etc/passwd
IgnorePath /etc/passwd-
IgnorePath /etc/resolv.conf
IgnorePath /etc/shadow
IgnorePath /etc/shadow-
IgnorePath /etc/shells
IgnorePath /etc/ssl/certs
IgnorePath /etc/subgid
IgnorePath /etc/subgid-
IgnorePath /etc/subuid
IgnorePath /etc/subuid-
IgnorePath /usr/bin/groupmems
IgnorePath /usr/lib
IgnorePath /usr/share/applications/mimeinfo.cache
IgnorePath /usr/share/glib-2.0/schemas/gschemas.compiled
IgnorePath /usr/share/icons
IgnorePath /usr/share/info/dir
IgnorePath /usr/share/info/dir
IgnorePath /usr/share/info/dir
IgnorePath /usr/share/mime
IgnorePath /var/.updated
IgnorePath /var/db/sudo
IgnorePath /var/lib/lastlog
IgnorePath /var/lib/libuuid
IgnorePath /var/lib/machines
IgnorePath /var/lib/NetworkManager
IgnorePath /var/lib/pacman
IgnorePath /var/lib/portables
IgnorePath /var/lib/private
IgnorePath /var/lib/systemd
IgnorePath /var/lib/tpm2-tss/system/keystore
IgnorePath /var/log
IgnorePath /var/tmp
IgnorePath /var/lib/geoclue
IgnorePath /var/lib/upower
IgnorePath /var/lib/boltd
IgnorePath /var/lib/colord

CreateLink /etc/os-release ../usr/lib/os-release
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CreateLink /var/lib/dbus/machine-id /etc/machine-id
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/fonts/conf.d/65-droid-kufi.conf /usr/share/fontconfig/conf.default/65-droid-kufi.conf
CreateLink /etc/fonts/conf.d/65-droid-sans-mono.conf /usr/share/fontconfig/conf.default/65-droid-sans-mono.conf
CreateLink /etc/fonts/conf.d/65-droid-sans.conf /usr/share/fontconfig/conf.default/65-droid-sans.conf
CreateLink /etc/fonts/conf.d/65-droid-serif.conf /usr/share/fontconfig/conf.default/65-droid-serif.conf
CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket
CreateLink /etc/localtime ../usr/share/zoneinfo/Europe/Budapest
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service

SetFileProperty /var/log/journal group systemd-journal



