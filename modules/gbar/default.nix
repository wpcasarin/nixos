{ ... }:

{
  # https://github.com/scorpion-26/gBar
  programs.gBar = {
    enable = true;
    config = {
      Location = "T";
      EnableSNI = true;
      DateTimeStyle = "%a %d %b   %H:%M";
      DefaultWorkspaceSymbol = "";
      # SNIIconName: Discord, discord-tray;
      SNIIconSize = {
        Discord = 26;
        OBS = 23;
      };
    };
    extraCSS = builtins.readFile ./gbar.css;
    extraConfig = ''
    SNIIconName: WebCord, discord-tray
    '';
  };
}
