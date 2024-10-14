AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
AddPackage git # the fast distributed version control system
AddPackage linux # The Linux kernel and modules
AddPackage micro # Modern and intuitive terminal-based text editor
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage fish
AddPackage networkmanager
AddPackage refind # An EFI boot manager
AddPackage vim 
AddPackage bash-completion # Programmable completion for the bash shell
AddPackage --foreign paru # Feature packed AUR helper
AddPackage --foreign paru-debug # Detached debugging symbols for paru

AddPackage nvidia # NVIDIA drivers for linux
AddPackage tlp # Linux Advanced Power Management
IgnorePath /etc/X11/xorg.conf.d/10-use-nvidia-only.conf
IgnorePath /etc/X11/xorg.conf.d/10-use-nvidia-only.conf.bak
CreateLink /etc/systemd/system/multi-user.target.wants/nvidia-persistenced.service /usr/lib/systemd/system/nvidia-persistenced.service
CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service
CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf

CopyFile /etc/hostname
CopyFile /etc/locale.conf
CopyFile /boot/refind_linux.conf
CopyFile /etc/locale.conf
CopyFile /etc/pacman.conf
CopyFile /etc/sudoers
CopyFile /etc/vconsole.conf
CopyFile /etc/locale.gen