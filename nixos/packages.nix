{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty

    zsh
    neofetch
    waybar
    curl
    git
    firefox
    rofi-wayland
    ranger
    virt-manager
    virt-viewer
    qemu
    libvirt
    swww
    home-manager
    xclip
    spotify

    lua-language-server
    rust-analyzer

    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
