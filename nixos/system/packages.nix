{config, pkgs, ... }:

{
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
	lua
	nodejs
	xclip

	spotify

	gcc
	clang
	go
	python3

	
	nil
	lua-language-server
	rust-analyzer
  ];
}
