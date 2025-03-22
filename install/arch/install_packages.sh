# ----------------------------------------------------- 
# Install packages 
# ----------------------------------------------------- 

installer_packages=(
    "hyprland"
    "rofi-wayland"
    "alacritty"
    "thunar"
    "xdg-desktop-portal-hyprland"
    "qt5-wayland"
    "qt6-wayland"
    "hyprpaper"
    "hyprlock"
    "ttf-font-awesome"
    "vim"
    "fastfetch"
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd"
    "fuse2"
    "gtk4"
    "libadwaita"
    "jq"
    "python-gobject"
    "xdotool"
    "brightnessctl"
    "networkmanager"
    "wireplumber"
)

installer_yay=(
    "wlogout" 
)

# PLEASE NOTE: Add more packages at the end of the following command
_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";
