{ inputs, pkgs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.holybaechu = {
      imports = [ ../home ];
      home.username = "holybaechu";
      home.homeDirectory = "/home/holybaechu";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users = {
    mutableUsers = false;

    users.holybaechu = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        kdePackages.kate
      ];
      hashedPassword = "$y$j9T$GVrHF4tMV1xGS60v8/INx0$uyUcHHBM6gAC75HAYMpT/GCcRLVOLP7AzMjydcKg.4.";
    };
  };
}
