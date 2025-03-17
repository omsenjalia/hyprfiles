# If not running interactively, don't do anything
if not status --is-interactive
    return
end

# Load starship prompt if starship is installed
if test -x /usr/bin/starship
    function __main
        set major (version bash | cut -d. -f1)
        set minor (version bash | cut -d. -f2)

        if test $major -gt 4 -o \( test $major -eq 4 -a $minor -ge 1 \)
            source ("/usr/bin/starship" init bash --print-full-init)
        else
            source /dev/stdin <<< ("/usr/bin/starship" init bash --print-full-init)
        end
    end
    __main
    functions -e __main
end

# Advanced command-not-found hook
if test -f /usr/share/doc/find-the-command/ftc.bash
    source /usr/share/doc/find-the-command/ftc.bash
end

## Useful aliases

# Replace ls with eza
if test -x /usr/bin/eza
    alias ls 'eza -al --color=always --group-directories-first --icons'     # preferred listing
    alias la 'eza -a --color=always --group-directories-first --icons'      # all files and dirs
    alias ll 'eza -l --color=always --group-directories-first --icons'      # long format
    alias lt 'eza -aT --color=always --group-directories-first --icons'     # tree listing
    alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
end

# Replace some more things with better alternatives
if test -x /usr/bin/bat
    alias cat 'bat --style header --style snip --style changes --style header'
end

if not test -x /usr/bin/yay -a -x /usr/bin/paru
    alias yay 'paru'
end

# Common use
alias grubup 'sudo update-grub'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias wget 'wget -c '
alias rmpkg 'sudo pacman -Rdd'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias upd '/usr/bin/garuda-update'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias dir 'dir --color=auto'
alias vdir 'vdir --color=auto'
alias grep 'ugrep --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias egrep 'ugrep -E --color=auto'
alias hw 'hwinfo --short'                          # Hardware Info
alias big "expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip 'ip -color'

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

# Help people new to Arch
alias apt 'man pacman'
alias apt-get 'man pacman'
alias please 'sudo'
alias tb 'nc termbin.com 9999'
alias helpme 'cht.sh --shell'
alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'

# Cleanup orphaned packages
alias cleanup 'sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

# Run fastfetch
fastfetch
