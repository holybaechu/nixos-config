{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        heroic
    ];

    programs = {
        steam = {
            enable = true;
            gamescopeSession.enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };

        gamescope = {
            enable = true;
            capSysNice = true;
            args = [
                "--rt"
                "--expose-wayland"
            ];
        };
    };
}
