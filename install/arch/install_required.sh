# ----------------------------------------------------- 
# Installation of required packages
# ----------------------------------------------------- 

installer_packages=(
    "wget"
    "unzip"
    "gum"
    "rsync"
    "figlet"
    "git"
    "hyprland"
    "ags-hyprpanel-git"
    "rofi-wayland"
    "alacritty"
    "thunar"
    "xdg-desktop-portal-hyprland"
    "qt6-wayland"
    "hyprpaper"
    "hyprlock"
    "firefox"
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
    "aylurs-gtk-shell-git"
    "wireplumber"
    "libgtop"
    "bluez"
    "bluez-utils"
    "networkmanager"
    "dart-sass"
    "wl-clipboard"
    "upower"
    "gvfs"
    "python"
    "python-gpustat"

## To control screen/keyboard brightness
    "brightnessctl"

## To check for pacman updates in the default script used in the updates module
    "pacman-contrib"

## To switch between power profiles in the battery module
    "power-profiles-daemon"

## To take snapshots with the default snapshot shortcut in the dashboard
   "grimblast"

## To record screen through the dashboard record shortcut
   "wf-recorder"

## To enable the eyedropper color picker with the default snapshot shortcut in the dashboard
   "hyprpicker"

## To enable hyprland's very own blue light filter
   "hyprsunset"

## To click resource/stat bars in the dashboard and open btop
    "btop"

## To enable matugen based color theming
    "matugen"

## To enable matugen based color theming and setting wallpapers
    "swww"
    "pywal"
    "python-pywalfox"
)

echo ":: Installing on $distro"

# Synchronizing package databases
sudo pacman -Sy
echo

# Install required packages
echo ":: Checking that required packages are installed..."
_installPackages "${installer_packages[@]}";

# Double check rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Force rsync installation"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync double checked"
fi
echo

# Install Yay
_installYay
