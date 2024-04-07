{
  config,
  lib,
  pkgs,
  ...
}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adrian = {
    isNormalUser = true;
    description = "adrian";
    extraGroups = ["networkmanager" "wheel" "libvirt" "libvirtd" "audio"];
    packages = with pkgs; [];
  };

  security.sudo.extraRules = [
    {
      users = ["adrian"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  # Enable automatic login for the user.
  services.getty.autologinUser = "adrian";
}
