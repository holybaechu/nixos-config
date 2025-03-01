{ pkgs, inputs, ... }:
{
    time.timeZone = "Asia/Seoul";
    i18n.defaultLocale = "ko_KR.UTF-8";
    system.stateVersion = "24.11";

    nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
    environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
}
