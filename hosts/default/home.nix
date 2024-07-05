{ config, pkgs, username, lib, ... }:

{
  imports = [
    ../../modules/gbar
    ../../modules/git
    ../../modules/hyprland
    ../../modules/kitty
    ../../modules/starship
    ../../modules/tofi
    ../../modules/vscodium
    ../../modules/zsh
    ../../modules/poetry
    ../../modules/firefox
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    bmon
    htop
    neovim
    nil
    nixpkgs-fmt
    pamixer
    pulsemixer
    qalculate-gtk
    #   webcord
    xdg-utils
    #    jetbrains.datagrip
    python3
    lz4
    zip
    unzip
    pcmanfm
    nodejs_20
    pnpm
    inkscape
    gimp
    chromium
    arduino
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Catppuccin-Mocha-Mauve-Cursors";
    XCURSOR_SIZE = "24";
    DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
    VSCODE_GALLERY_SERVICE_URL = "https://marketplace.visualstudio.com/_apis/public/gallery";
    VSCODE_GALLERY_ITEM_URL = "https://marketplace.visualstudio.com/items";
    VSCODE_GALLERY_CACHE_URL = "https://vscode.blob.core.windows.net/gallery/index";
    VSCODE_GALLERY_CONTROL_URL = "";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  home.activation = {
    regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "sky";
      };
      name = "Papirus-Dark";
    };
    catppuccin = {
      enable = true;
      flavor = "mocha";
      size = "compact";
      tweaks = [ "rimless" ];
      cursor = {
        enable = true;
      };
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desk";
      documents = "${config.home.homeDirectory}/docs";
      download = "${config.home.homeDirectory}/dwns";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pics";
      videos = "${config.home.homeDirectory}/vids";
      templates = "${config.home.homeDirectory}";
      publicShare = "${config.home.homeDirectory}";
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = [
            "hyprland"
          ];
        };
      };
    };
    desktopEntries = {
      nixos-manual = {
        name = "NixOS Manual";
        genericName = "System Manual";
        exec = "nixos-help";
        terminal = false;
        icon = "nix-snowflake";
        categories = [ "System" ];
        noDisplay = true;
      };
      nvim = {
        name = "Neovim";
        genericName = "Text Editor";
        exec = "nvim %F";
        terminal = true;
        icon = "nvim";
        categories = [ "Utility" "TextEditor" ];
        mimeType = [ "text/english" "text/plain" ];
        noDisplay = false;
      };
    };
  };

  programs.home-manager.enable = true;
}
