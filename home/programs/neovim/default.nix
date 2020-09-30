{ config, pkgs, ... }:

let
  myPlugins = with pkgs.vimPlugins; [
    coc-nvim       # LSP Client
    coc-yank       # Yank plugin for CoC
    dhall-vim      # Dhall syntax
    nerdtree       # Tree file explorer
    fzf-vim        # Fuzzy finder
    nord-vim       # Nord theme
    vim-airline    # Status bar
    vim-airline-themes # Themes
    vim-css-color  # Preview CSS colors
    vim-commentary # Comment lines in visual mode
    vim-devicons   # File type icons in status bar
    vim-easy-align # Alignment plugin
    vim-endwise    # Auto "end" in Ruby
    vim-fish       # Fish shell
    vim-fugitive   # Git plugin
    vim-go         # Golang
    vim-markdown   # Markdown syntax
    vim-nix        # Nix syntax
    vim-ruby       # Ruby
    vim-surround   # Surround
    vim-unimpaired # Bracket mappings
  ];

  baseConfig  = builtins.readFile ./config.vim;
  cocSettings = builtins.toJSON (import ./coc-settings.nix);

in
{
  programs.neovim = {
    enable       = true;
    extraConfig  = baseConfig;
    plugins      = myPlugins;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withNodeJs   = true; # Required by CoC
    withPython   = true; # Plugins
    withPython3  = true; # Plugins
  };

  xdg.configFile = {
    "nvim/coc-settings.json".text = cocSettings;
  };
}
