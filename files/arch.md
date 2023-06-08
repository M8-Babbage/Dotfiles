# Arch Linux

Instalación de Arch Linux

```bash
# 1. Setear el teclado a latinoamética - activar el guión con es
loadkeys es 
loadkeys la-latin-1

# 2. Conexión a internet - por cable no se hace nada
lwctl --passphrase "contraseñaWifi" station wlan0 connect "nombreWifi"

# 3. Ejecución del script archinstall
archinstall

# 4. Guía de arch install
Archinstall language -> Inglés
Keyboard layout -> la-latin1
Mirror region -> Colombia
Locale language -> en_US
Locale encoding -> UTF-8
Drive(s) -> Seleccionar el disco
Disk Layout -> Wipe all -> ext4
Disk encryption -> None
Bootloader -> systemd-bootctl
Swap -> True
Hostname -> Your hostname
Root password -> Your password
User account -> Your user account "superuser sudo" -> Confirm and exit
Profile -> Xorg -> All open-source
Audio -> Pulseaudio
Kernels -> Linux
Additional packages -> neovim git base-devel
Network configuration -> Use NetworkManager
Timezone -> America/Bogota
Automatic time sync (NTP) -> True 
Optional repositories -> multilib
Install

# 5. Podemos conectarnos a wifi usando el comando
nmcli device wifi list
nmcli device wifi connect TU_SSID password TU_CONTRASEÑA
```