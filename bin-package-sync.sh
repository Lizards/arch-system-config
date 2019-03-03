#!/bin/bash
# I don't want a meta-package, but I do want a convenient way to sync
# packages from the lists kept in https://github.com/Lizards/arch-installer


WORKING_DIR="/tmp/arch-installer"


function get_package_defs() {
    curl -L https://github.com/Lizards/arch-installer/tarball/master | tar -xz --strip-component=1
}


function install_packages() {
    # Import GPG keys for AUR packages
    grep -v '^ *#' < "chroot/packages/gpg-keys" | while IFS= read -r key
    do
        gpg --recv-keys "${key}"
    done
    readarray -t packages < "chroot/packages/arch"
    readarray -t aur_packages < "chroot/packages/aur"
    aur sync "${aur_packages[@]}"
    sudo pacman -Syu
    sudo pacman -S --needed --noconfirm "${packages[@]}" "${aur_packages[@]}"
}


function start_services() {
    # system services
    grep -v '^ *#' < "chroot/services/system" | while IFS= read -r service
    do
        sudo systemctl enable "${service}"
    done
    # user services
    grep -v '^ *#' < "chroot/services/user" | while IFS= read -r service
    do
        systemctl --user enable "${service}"
    done
}


function main() {
    rm -rf "${WORKING_DIR}"
    mkdir -p "${WORKING_DIR}"

    pushd "${WORKING_DIR}"
        get_package_defs
        install_packages
        start_services
    popd
}


main "$@"
