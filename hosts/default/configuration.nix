{ pkgs, username, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  #============ SYSTEM
  system.stateVersion = "23.11";
  #============ BOOTLOADER
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #============ NETWORKING
  networking = {
    networkmanager.enable = true;
    wireless.enable = false;
    hostName = "nixos";
  };
  #============ LOCALES
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  #============ USERS
  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    isNormalUser = true;
    description = "Wellington";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
  };
  #============ SECURITY
  security = {
    rtkit.enable = true;
  };
  #============ SERVICES
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
  #============ PROGRAMS
  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    ssh.startAgent = true;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  #============ NIX
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
