{ ... }:
{
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["holybaechu"];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
}
