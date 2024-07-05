{ pkgs, ... }:

{
  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      terminal = "${pkgs.kitty}/bin/kitty";
      drun-launch = true;
      font = "CaskaydiaCove NF SemiLight";
      prompt-color = "#f38ba8";
      selection-color = "#f9e2af";
      text-color = "#cdd6f4";
      background-color = "#000000AA";
    };
  };
}
