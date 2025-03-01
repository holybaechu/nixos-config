{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "framework";
 
  services.fprintd.enable = true;
}
