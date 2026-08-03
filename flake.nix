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
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        my-nvim = pkgs.writeShellApplication {
          name = "my-nvim";

          runtimeInputs = with pkgs; [
            neovim

            # Mandatory
            lua51Packages.lua
            tree-sitter
            lua51Packages.luarocks

            # LSP
            lua-language-server

            # Plugin deps
            lazygit
          ];

          text = ''
            export XDG_CONFIG_HOME=${./.}
            exec nvim "$@"
          '';
        };
      in
      {
        packages.my-nvim = my-nvim;

        overlays.default = final: prev: {
          my-nvim = my-nvim;
        };
      }
    );
}
