{
	plugins.toggleterm = {
		enable = true;
		settings = {
			persist_mode = false;
		};
	};

	extraConfigLua = ''
	-- ToggleTerm mappings for terminals 1-9
	for i = 1, 9 do
	  vim.keymap.set({"n", "v"}, "<leader>t" .. i, function()
	    vim.cmd("ToggleTerm " .. i)
	  end, {
	    noremap = true,
	    silent = true,
	    desc = "Toggle terminal " .. i
	  })
	end
	'';

	keymaps = [
		{
			mode = [
				"n"
				"v"
			];
			key = "<leader>tt";
			action = "<Cmd>ToggleTerm<CR>"; # :set autochdir<CR>
			options = {
				noremap = true;
				silent = true;
				desc = "Toggle all";
			};
		}
		{
			mode = [ "t" ];
			key = "<esc>";
			action = "<C-\\><C-n>"; # :set autochdir<CR>
			options = { buffer = false; };
		}
		{
			mode = [ "t" ];
			key = "<C-h>";
			action = "<Cmd>wincmd h<CR>"; # :set autochdir<CR>
			options = { buffer = false; };
		}
		{
			mode = [ "t" ];
			key = "<C-j>";
			action = "<Cmd>wincmd j<CR>"; # :set autochdir<CR>
			options = { buffer = false; };
		}
		{
			mode = [ "t" ];
			key = "<C-k>";
			action = "<Cmd>wincmd k<CR>"; # :set autochdir<CR>
			options = { buffer = false; };
		}
		{
			mode = [ "t" ];
			key = "<C-l>";
			action = "<Cmd>wincmd l<CR>"; # :set autochdir<CR>
			options = { buffer = false; };
		}
		{
			mode = [ "t" ];
			key = "<C-w>";
			action = "<C-\\><C-n><C-w>"; # :set autochdir<CR>
			options = { buffer = false; };
		}
	];
}
