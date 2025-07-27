{
	plugins.neo-tree = {
		enable = true;
		enableGitStatus = false;
		window.position = "left";
		window.width = 30;
		buffers.window.mappings = {
			"<space>" = "open";
			"h" = "close_node";
		};
	};

	keymaps = [
		{
			mode = [
				"n"
				"v"
			];
			key = "<leader>e";
			action = ":set autochdir<CR> :Neotree<CR>";
			options = {
				silent = true;
				desc = "Tree";
			};
		}
	];

}
