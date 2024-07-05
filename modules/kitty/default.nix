{ ... }:

{
  programs.kitty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      enable_audio_bell = false;
      font_size = "12.0";
      font_family = "CaskaydiaCoveNF-SemiLight";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      confirm_os_window_close = "0";
    };
  };
}
