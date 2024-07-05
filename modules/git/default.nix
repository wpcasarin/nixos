{ ... }:

{
  # https://wiki.nixos.org/wiki/Git
  programs.git = {
    enable = true;
    userName = "wpcasarin";
    userEmail = "72427968+wpcasarin@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

