{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # General packages
    alacritty
    aspell
    aspellDicts.en
    bash-completion
    coreutils
    devbox
    fzf
    killall
    lnav
    neofetch
    openssh
    sqlite
    wget
    zip

    # Rust rewrites
    bat
    btop
    eza
    fd
    gping
    hyperfine
    procs
    ripgrep

    # Encryption and security
    age
    age-plugin-yubikey
    gnupg
    libfido2
    bundletool
    rbw

    # Media
    ffmpeg

    # Text and terminal utilities
    htop
    hunspell
    iftop
    jq
    tmux
    tree
    unrar
    unzip
    zsh-powerlevel10k
    texliveFull
    clipboard-jh
    tmatrix

    uv
    python3
    android-tools
    exercism
  ];
}
