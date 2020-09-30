{
  "languageserver" = {
    "dhall" = {
      "command" = "dhall-lsp-server";
      "filetypes" = [ "dhall" ];
    };

    "go" = {
      "command" = "gopls";
      "rootPatterns" = [ "go.mod" ];
      "trace.server" = "verbose";
      "filetypes" = [ "go" ];
    };

    "haskell" = {
      "command" = "ghcide";
      "args" = "lsp";
      "filetypes" = [ "hs" "lhs" "haskell" ];
    };

    "nix" = {
      "command" = "rnix-lsp";
      "filetypes" = [ "nix" ];
    };
  };

  "yank.highlight.duration" = 700;
}
