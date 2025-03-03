{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        legcord
    ];
}
