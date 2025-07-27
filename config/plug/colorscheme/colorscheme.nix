{ config, ... }:
let
	lua = x: { __raw = x; };
in
	{
	colorschemes = {
		base16 = {
			enable = true;
			setUpBar = false;
			colorscheme = import ../../colors/${config.theme}.nix { };
			settings = {
				cmp = true;
				illuminate = true;
				indentblankline = true;
				lsp_semantic = true;
				mini_completion = true;
				telescope = false;
				telescope_borders = false;
				lazygit = true;
				neotree = true;
			};
		};
		oxocarbon.enable = false;
		poimandres = {
			enable = false;
			settings.disable_background = true;
		};
	};
}
