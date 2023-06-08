# BSPWM

### Instalación de BSPWM & SXHKD

```bash
# 1. Instalar dependencias
sudo pacman -S xorg xorg xorg-xinit code alacritty bspwm sxhkd libxcb xcb-util xcb-util-wm xcb-util-keysyms xcb-util-cursor ttf-dejavu ttf-liberation noto-fonts

# 2. Crear el archivo de xinitrc y editarlo para para arrancar Qtile
cp /etc/X11/xinit/xinitrc ~/.xinitrc
exec bspwm

# 3. Crear los archivos de configuración para bspwm y sxhkd
mkdir -p ~/.config/{bspwm,sxhkd}
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
chmod u+x ~/.config/bspwm/bspwmrc

# 4. Modificar el archivo sxhkd para colocar la terminal que instalamos
nvim ~/.config/sxhkd/sxhkdrc
# Donde dice terminal emulator, cambiamos por alacritty

# 5. Al finalizar la configuración podrá ejecutar BSPWM usando
startx

```

### Asistente pacman - Yay

```bash
# 1. Descarga de repositorios
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R username:username yay-git/
cd yay-git
makepkg -si
```

### Google Chrome

```bash
# 1. Descargar el repositorio
git clone https://aur.archlinux.org/google-chrome.git

# 2. Compilar, si no funciona debe instalar el paquete base-devel
makepkg -si

# 3. Ya se puede ejecutar con
google-chrome-stable

# 4. Mapear google chrome en sxhkd
Super + g
				google-chrome-stable
```

### Sonido - Pulseaudio

```bash
# 1. Instalar dependencias
sudo pacman -S volumeicon cbatticon pulseaudio pavucontrol

# 2. Añadir el arranque a bspwm
volumeicon &
cbatticon &

# 3. Añadir los atajos para subir y bajar volumen en sxhkd
XF86AudioLowerVolume
										pactl set-sink-volume @DEFAULT_SINK@ -5%
XF86AudioRaiseVolume
										pactl set-sink-volume @DEFAULT_SINK@ +5%
XF86AudioMute
						 pactl set-sink-mute @DEFAULT_SINK@ toggle
```

### Brillo - Brightnessctl

```bash
# 1. Instalar dependencias
sudo pacman -S brightnessctl

# 2. Añadir los atajos para subir y bajar volumen en sxhkd
XF86MonBrightnessUp
									brightnessctl set +10%
XF86MonBrightnessDown
										brightnessctl set 10%-
```

### Fondo de pantalla - Nitrogen

```bash
# 1. Instalar dependencias
sudo pacman -S nitrogen

# 2. Abrir la carpeta que contiene la imágen de fondo
nitrogen ~/.config/settings

# 3. En las opciones de abajo
Scaled -> Full Screen - Apply

# 4. En el archivo de configuración de bpswm colocamos
nitrogen --restore &

```

### Lanzador de aplicaciones - Rofi

```bash
# 1. Instalar dependencias
sudo pacman -S rofi

# 2. Configurar los atajos en sxhkd
super + m
				rofi -show run
```

### Gestor de almacenamiento

```bash
# 1. Instalar dependencias
sudo pacman -S udiskie ntfs-3g

# 2. Añadir en bspwm
udiskie -t &
```

### Conexión a wifi - Network-Manager-Applet

```bash
# 1. Instalación de dependencias
sudo pacman -S network-manager-applet

# 2. Añadir en bspwm
nm-applet &
```

### Gestor de archivos - Thunar

```bash
# 1. Instalar dependencias para administrador de archivos y basura
sudo pacman -S thunar gvfs unzip

# 2. Configurar terminal para thunar
mkdir ~/.config/xfce4
touch ~/.config/xfce4/helpers.rc
nvim ~/.config/xfce4/helpers.rc

# 3. Configurar el terminal por defecto para thunar
TerminalEmulator=alacritty

# 4. Descargar temas para cursor, iconos y tema
https://www.gnome-look.org/p/1499852/
https://www.gnome-look.org/p/1316887/  "Material-Black-Blueberry-2.9.9.tar"
https://www.gnome-look.org/p/1333360/ "Material-Black-Blueberry-Suru_1.9.3.zip"

tar xf $file.tar.gz
unzip $file.zip

# 5. Crear carpetas para guardar los archivos
mkdir ~/{.icons,.themes}
mv Material-Black-Blueberry ~/.themes
mv Fluent-cursors ~/.icons

# 5. Configurar el cursor, iconos y tema usando lxappearance
sudo pacman -S lxappearance
```

### Multimedia - Qeeqie, Vlc, Flameshot

```bash
# 1. Instalar dependencias
sudo pacman -S geeqie vlc flameshot

# 2. Añadir flameshot en el archivo de bspwm
flameshot &

# 3. Añadir el atajo a sxhkd
Print
		 flameshot gui
```

### Notificaciones - Dunst

```bash
# 1. Instalación de dependencias
sudo pacman -S dunst

# 2. Agregar el archivo de configuración de ejemplo
mkdir ~/.config/dunst
cp /etc/dunst/dunstrc ~/.config/dunst/dunstrc

# 3. Agregar el lanzamiento desde bspwm cargando la configuración
dunst -conf ~/.config/dunst/dunstrc &
```

### Monitores - Arandr

```bash
# 1. Instalación de dependencias
sudo pacman -S arandr

# 2. Ejecutar arandr
arandr

# 3. Organizar las pantallas en la interfaz y guardar el script
```

### Media transfer protocol

```bash
# 1. Instalación de dependencias
sudo pacman -S libmtp
yay -S simple-mtpfs

# 2. Opcional - Lista todos los dispositivos conectados
simple-mtpfs -l
# 3. Opcional - Monta el primer dispositivo de la lista anterior
simple-mtpfs --device 1 /mount/point
```

### Compositor - Picom

```bash
# 1. Instalación de dependencias
sudo pacman -S picom

# 2. Copiar configuración por defecto
mkdir -p ~/.config/picom/
cp /etc/xdg/picom.conf ~/.config/picom/picom.conf

# 3. Añadir en bspwm
picom --config ~/.config/picom/picom.conf &
```

### ZSH - OhMyZSH

```bash
# 1. Instalar zsh
sudo pacman -S zsh

# 2. Instalar Fira Code
sudo pacman -S ttf-firacode-nerd

# 3. Crear una carpeta y pegar configuración
mkdir ~/.config/alacritty
touch ~/.config/alacritty/alacritty.yml

# 4. Instalar OhMyZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Pegar la configuración
# TokyoNight Alacritty Colors
colors:
  # Default colors
  primary:
    background: '0x1a1b26'
    foreground: '0xc0caf5'

  # Normal colors
  normal:
    black:   '0x15161E'
    red:     '0xf7768e'
    green:   '0x9ece6a'
    yellow:  '0xe0af68'
    blue:    '0x7aa2f7'
    magenta: '0xbb9af7'
    cyan:    '0x7dcfff'
    white:   '0xa9b1d6'

  # Bright colors
  bright:
    black:   '0x414868'
    red:     '0xf7768e'
    green:   '0x9ece6a'
    yellow:  '0xe0af68'
    blue:    '0x7aa2f7'
    magenta: '0xbb9af7'
    cyan:    '0x7dcfff'
    white:   '0xc0caf5'

font:
  size: 12.0
  normal:
    family: FiraCode Nerd Font
    style: Medium
  bold:
    family: FiraCode Nerd Font
  italic:
    family: FiraCode Nerd Font

  indexed_colors:
    - { index: 16, color: '0xff9e64' }
    - { index: 17, color: '0xdb4b4b' }

window:
  dimensions:
    columns: 55
    lines: 18
  padding:
    x: 30
    y: 30
```

### Shell Color Scripts

```bash
# 1. Instalación de dependencias
yay -S shell-color-scripts

# 2. Añadir en ZSH
colorscript -e 9 || 21 || 39
```

### Neofetech

```bash
# 1. Instalar neofetch
sudo pacman -S neofetch

# 2. Crear carpeta y archivo de configuración
mkdir ~/.config/neofetch
touch ~/.config/neofetch/config.conf

# 3. Pegar configuración de neofetch
print_info() {
    info title
    info underline
    info "OS" distro
    info "Host" model
    info "Kernel" kernel
    info "Shell" shell
    info "CPU" cpu
    info "Memory" memory
}

title_fqdn="off"
kernel_shorthand="on"
distro_shorthand="off"
os_arch="on"
uptime_shorthand="on"
memory_percent="off"
memory_unit="mib"
package_managers="on"
shell_path="off"
shell_version="on"
speed_type="bios_limit"
speed_shorthand="off"
cpu_brand="on"
cpu_speed="on"
cpu_cores="logical"
cpu_temp="off"
gpu_brand="on"
gpu_type="all"
refresh_rate="off"
gtk_shorthand="off"
gtk2="on"
gtk3="on"
public_ip_host="http://ident.me"
public_ip_timeout=2
de_version="on"
disk_show=('/')
disk_subtitle="mount"
disk_percent="on"
music_player="auto"
song_format="%artist% - %album% - %title%"
song_shorthand="off"
mpc_args=()
colors=(distro)
bold="on"
underline_enabled="on"
underline_char="-"
separator=":"
block_range=(0 15)
color_blocks="on"
block_width=3
block_height=1
col_offset="auto"
bar_char_elapsed="-"
bar_char_total="="
bar_border="on"
bar_length=15
bar_color_elapsed="distro"
bar_color_total="distro"
cpu_display="off"
memory_display="off"
battery_display="off"
disk_display="off"
image_backend="ascii"
image_source="auto"
ascii_distro="OpenBSD_small"
ascii_colors=(distro)
ascii_bold="on"
image_loop="off"
thumbnail_dir="${XDG_CACHE_HOME:-${HOME}/.cache}/thumbnails/neofetch"
crop_mode="normal"
crop_offset="center"
image_size="auto"
gap=3
yoffset=0
xoffset=0
background_color=
stdout="off"
```

### Personalización BSPWM

```bash
# 1. Añadir border en bspwm
#### BSPWM configuration ####
#bspc config border_radius                8
bspc config border_width                  2
bspc config window_gap                    10
bspc config top_padding                   20
bspc config bottom_padding                0
bspc config left_padding                  0
bspc config right_padding                 0
bspc config single_monocle                false
bspc config click_to_focus                true
bspc config split_ratio                   0.50
bspc config borderless_monocle            true
bspc config gapless_monocle               true
bspc config focus_by_distance             true
bspc config focus_follows_pointer         true
bspc config history_aware_focus           true
bspc config remove_disabled_monitors      true
bspc config merge_overlapping_monitors    true
bspc config pointer_modifier mod4
bspc config pointer_action1 move
bspc config pointer_action2 resize_side
bspc config pointer_action3 resize_corner

#### BSPWM coloring ####
bspc config normal_border_color       "#4c566a"
bspc config active_border_color	      "#1e1e1e"
bspc config focused_border_color	    "#5e81ac"
bspc config presel_feedback_color	    "#5e81ac"
bspc config urgent_border_color 	    "#dd2727"
```

### Polybar

```bash
# 1. Instalación de dependencias
sudo pacman -S polybar

# 2. Copiar archivo por defecto
mkdir ~/.config/polybar
cp /etc/polybar/config.ini ~/.config/polybar/config.ini

# 3. Añadir polybar a bspwm
polybar &
```