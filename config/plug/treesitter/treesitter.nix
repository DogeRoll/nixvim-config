{ pkgs, ... }:
{
	plugins.treesitter = {
		enable = true;
		folding = true;
		settings = {
			indent = {
				enable = true;
			};
			highlight = {
				enable = true;
			};
			ensureInstalled = [
				"c"
				"c_sharp"
				"make"
				"bash"
				"diff"
				"kconfig"
				"cpp"
				"cmake"
				"lua"
				"nix"
				"markdown"
				"markdown_inline"
				"doxygen"
			];
		};

		grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
			c
			c_sharp
			make
			bash
			diff
			kconfig
			cpp
			cmake
			lua
			nix
			markdown
			markdown_inline
			doxygen
		];
	};

}
