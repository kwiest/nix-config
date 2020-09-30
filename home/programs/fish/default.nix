{ config, pkgs, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color-always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || find ."
  '';

  rbenvConfig = ''
    set -x PATH $HOME/.rbenv/bin $PATH
    rbenv init - | source
  '';

  fishConfig = ''
    set -p fish_function_path ${pkgs.fish-foreign-env}/share/fish-foreign-env/functions
    fenv source ~/.nix-profile/etc/profile.d/nix.sh
    set -e fish_function_path[1]
  '' + fzfConfig + rbenvConfig;

in
{
  programs.fish = {
    enable = true;
    promptInit = ''
      eval (direnv hook fish)
      any-nix-shell fish --info-right | source
    '';
    shellAliases = {
      be = "bundle exec";
      ll = "ls -la";
    };
    shellInit = fishConfig;
  };
}
