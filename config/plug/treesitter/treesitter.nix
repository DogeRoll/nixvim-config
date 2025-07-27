{ pkgs, ... }:
{
	plugins.treesitter = {
		enable = true;

		settings = {
			indent = {
				enable = true;
			};
			highlight = {
				enable = true;
			};
			ensureInstalled = [
				"c"
				"cpp"
				"cmake"
				"make"
				"devicetree"
				"lua"
				"nix"
				"bash"
				"doxygen"
				"markdown"
				"markdown_inline"
			];
		};

		folding = true;
		nixvimInjections = true;
		grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
	};

}
