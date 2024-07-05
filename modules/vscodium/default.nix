{ pkgs, vscode-extensions, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
    extensions = with vscode-extensions.vscode-marketplace; [
      catppuccin.catppuccin-vsc # Catppuccin for VSCode
      catppuccin.catppuccin-vsc-icons # Catppuccin Icons for VSCode
      jnoortheen.nix-ide
      yzhang.markdown-all-in-one
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      ms-toolsai.jupyter
      ms-python.black-formatter
      ms-python.isort
      ms-python.mypy-type-checker
      ms-python.pylint
      visualstudioexptteam.vscodeintellicode
      njpwerner.autodocstring
      kevinrose.vsc-python-indent
      esbenp.prettier-vscode
      richie5um2.vscode-sort-json
      christian-kohler.path-intellisense
      streetsidesoftware.code-spell-checker
      streetsidesoftware.code-spell-checker-portuguese-brazilian
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      mhutchie.git-graph
      dotenv.dotenv-vscode # Dotenv Official +Vault
      # Webdev
      bradlc.vscode-tailwindcss # Tailwind CSS IntelliSense
      # stivo.tailwind-fold # Tailwind Fold
      dbaeumer.vscode-eslint # ESLint
      antfu.vite # Vite
      # svelte.svelte-vscode
      yoavbls.pretty-ts-errors
    ];
    userSettings = {
      "editor.fontFamily" = "CaskaydiaCove NF";
      "editor.tabSize" = 2;
      "editor.fontSize" = 16;
      "editor.fontLigatures" = true;
      "editor.fontWeight" = "300";
      "editor.formatOnSave" = true;
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.codeActionsOnSave" = {
        "source.fixAll" = "explicit";
      };
      "editor.quickSuggestions" = {
        "strings" = "on";
      };
      "editor.tokenColorCustomizations" = {
        "textMateRules" = [
          {
            "scope" = "keyword.other.dotenv";
            "settings" = {
              "foreground" = "#FF000000";
            };
          }
        ];
      };
      # WORKBENCH
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
      # PYTHON
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
        };
      };
      "black-formatter.args" = [ "--line-length" "119" ];
      "isort.args" = [ "--profile" "black" ];
      # JSONC
      "[jsonc]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      # NIX
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };
      # CSS
      "[css]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      # JAVASCRIPT
      "javascript.suggest.paths" = false;
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      # TYPESCRIPT
      "typescript.suggest.paths" = false;
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      # SVELTE
      "[svelte]" = {
        "editor.defaultFormatter" = "svelte.svelte-vscode";
      };
      # OTHER
      "cSpell.language" = "en,pt,pt_BR";
      "files.associations" = {
        "*.css" = "tailwindcss";
        ".env*" = "dotenv";
      };
      "tailwindCSS.includeLanguages" = {
        "templ" = "html";
      };
      # "tailwindCSS.experimental.classRegex" = [
      #   [ "cva\\(([^)]*)\\)" "[\"'`]([^\"'`]*).*?[\"'`]" ]
      #   [ "cx\\(([^)]*)\\)" "(?:'|\"|`)([^']*)(?:'|\"|`)" ]
      # ];
    };
  };
}
