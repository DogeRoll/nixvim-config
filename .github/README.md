<div align="center">
 <a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Jaini+Purva&size=64&pause=1000&color=AFAAFF&center=true&vCenter=true&width=435&height=80&lines=nixvi" alt="Typing SVG" /></a>
</div>

<h1 align="center"> nixvim-based neovim configuration <br> focused on C  development </h1>

<img src="assets/code.png" alt="nixvi">

<details>
    <summary>More</summary>
    <img src="assets/dash.png" alt="dashboard">
    <img src="assets/file-picker.png" alt="file picker">
    <img src="assets/trouble.png" alt="trouble">
    <img src="assets/markdown.png" alt="markdown">
</details>

## Configuring

To start configuring, just add or modify the nix files in `./config`.
If you add a new configuration file, remember to add it to the [`config/default.nix`](../config/default.nix) file

### Current plugins

### Current plugins

- **[colorscheme/](../config/plug/colorscheme):** Theme configuration. Current one is [paradise](https://github.com/paradise-theme/paradise)

- **[completion/](../config/plug/completion)**

  - **[nvim-cmp](../config/plug/completion/cmp.nix):** Completion plugin for nvim
  - **[lspkind](../config/plug/completion/lspkind.nix):** vscode-like pictograms for neovim lsp completion items

- **[git/](../config/plug/git)**

  - **[gitsigns](../config/plug/git/gitsigns.nix):** Git integration for buffers
  - **[gitpad](../config/plug/git/gitpad.nix):** Provides minimal per-Project/File/Branch note taking

- **[lsp/](../config/plug/lsp)**

  - **[fidget](../config/plug/lsp/fidget.nix):** LSP progress notifications
  - **[lsp](../config/plug/lsp/lsp.nix):** LSP configs
  - **[lspsaga](../config/plug/lsp/lspsaga.nix):** Cool LSP features
  - **[none-ls](../config/plug/lsp/none-ls.nix):** null-ls replacement. Use nvim as LSP
  - **[clangd-extensions](../config/plug/lsp/clangd-extensions.nix):** Inlay hints and much more

- **[snippet/](../config/plug/snippet)**

  - **[luasnip](../config/plug/snippet/luasnip.nix):** Snippet engine in lua

- **[statusline/](../config/plug/statusline)**

  - **[lualine](../config/plug/statusline/lualine.nix):** Status line for neovim

- **[treesitter/](../config/plug/treesitter)**

  - **[treesitter-context](../config/plug/treesitter/treesitter-context.nix):** Show code context
  - **[treesitter-textobject](../config/plug/treesitter/treesitter-textobject.nix):** Allow cool text manipulation thanks to TS
  - **[treesitter](../config/plug/treesitter/treesitter.nix):** Parser generator tool to build a syntax tree of the current buffer

- **[ui/](../config/plug/ui)**

  - **[bufferline](../config/plug/ui/bufferline.nix):** VSCode-like line for buffers
  - **[noice](../config/plug/ui/noice.nix):** Better nvim UI
  - **[web-devicons](../config/plug/ui/web-devicons.nix):** Adds file type icons
  - **[smear.nix](../config/plug/ui/smear.nix):** Cool cursor animation
  - **[ufo.nix](../config/plug/ui/ufo.nix):** Folds
  - **[colorizer.nix](../config/plug/ui/colorizer.nix):** Renders color codes.
  - **[illuminate.nix](../config/plug/ui/illuminate.nix):** Highlights all occurrences of word under cursor in buffer.
  - **[markview.nix](../config/plug/ui/markview.nix):** Renders markdown in place, for note-taking.

- **[utils/](../config/plug/utils)**

  - **[comment](../config/plug/utils/comment.nix):** Quickly toggle comments
  - **[smart-splits](../config/plug/ui/smart-splits.nix):** Resize splits more intelligently
  - **[nvim-autopairs](../config/plug/utils/nvim-autopairs.nix):** Autopairs in nvim
  - **[undotree](../config/plug/utils/undotree.nix):** Undo history visualizer
  - **[whichkey](../config/plug/utils/whichkey.nix):** Popup to display keybindings
  - **[trouble](../config/plug/utils/trouble.nix):** Pretty interface for working with LSP
  - **[neo-tree](../config/plug/utils/neo-tree.nix):** File explorer tree


If you have nix installed, you can directly run my config from anywhere:

```shell
nix run 'github:danylo-volchenko/nixvi'
```

## Installing into NixOS configuration

This `nixvim` flake will output a derivation that you can easily include
in either `home.packages` for `home-manager`, or
`environment.systemPackages` for `NixOS`. Or whatever happens with darwin?

You can add my `nixvim` configuration as an input to your `NixOS` configuration like:

```nix
{
 inputs = {
    nixvim.url = "github:danylo-volchenko/nixvi";
 };
}
```

### Direct installation

With the input added you can reference it directly.

```nix
{ inputs, system, ... }:
{
  # NixOS
  environment.systemPackages = [ inputs.nixvim.packages.${pkgs.system}.default ];
  # home-manager
  home.packages = [ inputs.nixvim.packages.${pkgs.system}.default ];
}
```

The binary built by `nixvim` is already named as `nvim` so you can call it just
like you normally would.

### Installing as an overlay

Another method is to overlay your custom build over `neovim` from `nixpkgs`.

This method is less straight-forward but allows you to install `neovim` like
you normally would. With this method you would just install `neovim` in your
configuration (`home.packges = with pkgs; [ neovim ]`), but you replace
`neovim` in `pkgs` with your derivation from `nixvim`.

```nix
{
  pkgs = import inputs.nixpkgs {
    overlays = [
      (final: prev: {
        neovim = inputs.nixvim.packages.${pkgs.system}.default;
      })
    ];
  }
}
```
