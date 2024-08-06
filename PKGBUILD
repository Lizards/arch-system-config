pkgbase=system-config
pkgname=(base-config radomir-config mikhail-config boris-config)
pkgver=1.10
pkgrel=4

pkgdesc='Custom system configurations'
arch=('any')
url='https://github.com/Lizards/arch-system-config'
license=('custom')

source=(
    'bin-package-sync.sh'
    'etc-modprobe-pcspkr.conf'
    'etc-pacman-mirror-upgrade.hook'
    'etc-pacman-paccache-remove.hook'
    'etc-pacman-paccache-upgrade.hook'
    'etc-pacman-systemd-boot.hook'
    'etc-samba-smb.conf'
    'etc-sysctl-max-user-watches.conf'
    'etc-xorg-intel-backlight.conf'
    'etc-xorg-libinput-touchpad.conf'
    'etc-xorg-no-mouse-accel.conf'
    'sudo-wheel'
)


package_base-config() {
    pkgdesc='Common system configuration'
    depends=(
        'sudo'
    )
    install=base-config.install

    install -Dm0755 bin-package-sync.sh "$pkgdir"/usr/local/bin/package-sync
    install -Dm0644 etc-modprobe-pcspkr.conf "$pkgdir"/etc/modprobe.d/pcspkr.conf
    install -Dm0600 sudo-wheel "$pkgdir"/etc/sudoers.d/wheel
    install -Dm0644 etc-pacman-mirror-upgrade.hook "$pkgdir"/etc/pacman.d/hooks/mirror-upgrade.hook
    install -Dm0644 etc-pacman-paccache-upgrade.hook "$pkgdir"/etc/pacman.d/hooks/paccache-upgrade.hook
    install -Dm0644 etc-pacman-paccache-remove.hook "$pkgdir"/etc/pacman.d/hooks/paccache-remove.hook
    install -Dm0644 etc-pacman-systemd-boot.hook "$pkgdir"/etc/pacman.d/hooks/systemd-boot.hook
    install -Dm0644 etc-samba-smb.conf "$pkgdir"/etc/samba/smb.conf
    install -Dm0644 etc-sysctl-max-user-watches.conf "$pkgdir"/etc/sysctl.d/40-max-user-watches.conf
    install -Dm0644 etc-xorg-no-mouse-accel.conf "$pkgdir"/etc/X11/xorg.conf.d/50-no-mouse-accel.conf
}


package_mikhail-config() {
    pkgdesc='System configurations for mikhail (desktop PC)'
    depends=('base-config')
    conflicts=('radomir-config' 'boris-config')
}


package_boris-config() {
    pkgdesc='System configurations for boris (X1 Carbon Gen 6)'
    depends=('base-config' 'mesa-amber' 'xf86-video-intel' 'xf86-input-libinput' 'xorg-xbacklight' 'fwupd')
    optdepends=('lenovo-throttling-fix-git: Lenovo power management patch')
    conflicts=('radomir-config' 'mikhail-config')

    install -Dm0644 etc-xorg-intel-backlight.conf "$pkgdir"/etc/X11/xorg.conf.d/10-intel-backlight.conf
    install -Dm0644 etc-xorg-libinput-touchpad.conf "$pkgdir"/etc/X11/xorg.conf.d/51-libinput-touchpad.conf
}

package_radomir-config() {
    pkgdesc='System configurations for radomir (X1 Carbon Gen 12)'
    depends=('base-config' 'sof-firmware' 'intel-media-driver' 'xf86-input-libinput' 'acpilight' 'fwupd')
    conflicts=('mikhail-config' 'boris-config')

    install -Dm0644 etc-xorg-libinput-touchpad.conf "$pkgdir"/etc/X11/xorg.conf.d/51-libinput-touchpad.conf
}


md5sums=('d73e8e49ec2d7c4b7b6d9d2c30e40f81'
         'a9ceb54c8a4640b71cb64ba29586c7bb'
         'ab5c11edd04b6e4fc104c383d04d4313'
         '3cc617fe0aecd037ea7f45fd2e06221b'
         '3af7587abe25c2b96c58ab50fd9554e4'
         'dce4058960baf1608bfa496e0c8ad715'
         '1c95f7edc3d1fb6ac204b7be5787ab1b'
         'acaed183146fb92c5db187472ec69e63'
         'c20980fa99ab840ff3a501644fdb3343'
         'ea90af87197b37469835c2683273ea44'
         '5d6b7b66421ade7b81417444e232aeb0'
         '2276728219e4c67d0d4176e4bd1992c4')
