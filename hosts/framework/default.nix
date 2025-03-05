{ pkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.home-manager
    ];

    # Networking
    networking.hostName = "framework";
    services.fprintd.enable = true;

    networking.wg-quick.interfaces = {
        wg0 = {
            configFile = "/etc/wireguard/framework.conf";
            autostart = false;
        };
    };

    # Home
    home-manager.users.holybaechu = { config, ... }: {
        services.easyeffects.enable = true;
    };
}
