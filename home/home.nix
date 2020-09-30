{ config, pkgs, ... }:

let
  defaultPkgs = with pkgs; [
    any-nix-shell # Support fish or zsh with nix-shell
    gopls         # Go LSP
    nix-direnv    # Nix integration for direnv
    ripgrep       # Fast file search
    rnix-lsp      # Nix LSP
    tree
  ];

  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy
  ];

in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./programs/git/default.nix
    ./programs/fish/default.nix
    ./programs/neovim/default.nix
  ];

  home = {
    stateVersion = "20.03";

    packages = defaultPkgs ++ gitPkgs;

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    alacritty = {
      enable = true;
      settings = {
        dimensions.columns = 120;
        dimensions.lines = 60;

        font = {
          size = 22;
          normal.family = "Hasklig";
          bold.family = "Hasklig";
          italic.family = "Hasklig";
        };
      };
    };

    direnv = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    go.enable = true;

    gpg.enable = true;
  };
}
