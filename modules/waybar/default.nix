{ config, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    catppuccin.enable = true;
    style = builtins.readFile ./style.css;
  };

  home.file."${config.xdg.configHome}/waybar/config.jsonc" = {
    source = ./config.jsonc;
  };
}
