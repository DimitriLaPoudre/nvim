{
  description = "Personal flake for NeoVim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      mkNvim =
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.writeShellApplication {
          name = "my-nvim";

          runtimeInputs = with pkgs; [
            neovim

            # Mandatory
            git
            ripgrep
            lua51Packages.lua
            tree-sitter
            lua51Packages.luarocks

            # LSP
            lua-language-server

            # Plugin deps
            lazygit
          ];

          text = ''
            export XDG_CONFIG_HOME=${./config}
            exec nvim "$@"
          '';
        };
    in
    (flake-utils.lib.eachDefaultSystem (system: {
      packages.my-nvim = mkNvim system;
    }))
    // {
      overlays.default = final: prev: {
        my-nvim = mkNvim prev.system;
      };
    };
}
