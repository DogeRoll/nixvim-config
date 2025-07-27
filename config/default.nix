{ config, lib, ... }:
{ imports = [
		# Base settings
		./autocommands.nix
		./keys.nix
		./sets.nix
		./highlight.nix
		# Colorschemes
		./plug/colorscheme/colorscheme.nix
		# Completion and LSP
		./plug/completion/cmp.nix
		./plug/completion/lspkind.nix
		./plug/lsp/fidget.nix
		./plug/lsp/lsp.nix
		./plug/lsp/lspsaga.nix
		./plug/lsp/none-ls.nix
		./plug/lsp/clangd-extensions.nix
		# Git integration
		./plug/git/gitsigns.nix
		./plug/git/gitpad.nix
		# Snippets
		./plug/snippets/luasnip.nix
		# Statusline
		./plug/statusline/lualine.nix
		# Treesitter
		./plug/treesitter/treesitter-context.nix
		./plug/treesitter/treesitter-textobjects.nix
		./plug/treesitter/treesitter.nix
		# UI Enhancements
		./plug/ui/smear.nix
		./plug/ui/web-devicons.nix
		./plug/ui/bufferline.nix
		./plug/ui/noice.nix
		./plug/ui/illuminate.nix
		./plug/ui/markview.nix
		./plug/ui/colorizer.nix
		./plug/ui/ufo.nix
		# Utility Plugins
		./plug/utils/sleuth.nix
		./plug/utils/persistence.nix
		./plug/utils/smart-splits.nix
		./plug/utils/comment.nix
		./plug/utils/trouble.nix
		./plug/utils/mini.nix
		./plug/utils/neo-tree.nix
		./plug/utils/nvim-autopairs.nix
		./plug/utils/undotree.nix
		./plug/utils/whichkey.nix
		./plug/utils/marks.nix
		
		./plug/snacks/default.nix
	];
	# Theme options
	options = {
		theme = lib.mkOption {
			default = lib.mkDefault "paradise";
			type = lib.types.enum [
				"paradise"
				"poimandres"
			];
		};
	};
	# Configuration
	config = {
		theme = "paradise";
		extraConfigLua = ''
	  _G.theme = "${config.theme}"
	  '';
	};
}
