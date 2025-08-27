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

### Current plugins are listed inside [`config/default.nix`](../config/default.nix) file.

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
