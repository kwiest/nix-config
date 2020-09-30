{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
      autocrlf = "input";
      pager = "diff-so-fancy | less --tabs=4 -RFX";
    };
    github.user = "kwiest";
    color.ui = true;
    mergetool ={
      cmd    = "nvim -f -c \"Gvdiffsplit!\" \"$MERGED\"";
      prompt = false;
    };
  };

in
{
  programs.git = {
    enable = true;

    aliases = {
      aa = "add --all";
      b = "branch";
      ci = "commit";
      co = "checkout";
      fp = "fetch -p";
      please = "push --force-with-lease";
      st = "status";
      l = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short --max-count=15";
    };
    extraConfig = gitConfig;
    userName = "Kyle Wiest";
    userEmail = "kylew@bluebottlecoffee.com";
  };
}
