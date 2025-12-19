{
	plugins.toggleterm = {
		enable = true;
		settings = {
			persist_mode = false;
			size.__raw = ''
				function(term)
					if term.direction == "horizontal" then
						return 8
					elseif term.direction == "vertical" then
						return math.floor(vim.o.columns * 0.4)
					else
						return 20
					end
				end
			'';
		};
	};

	extraConfigLua = ''
	-- ToggleTerm mappings for terminals 1-9
	for i = 1, 5 do
	  vim.keymap.set({"n", "v"}, "<leader>t" .. i, function()
	    vim.cmd("ToggleTerm " .. i)
	  end, {
	    noremap = true,
	    silent = true,
	    desc = "Toggle terminal " .. i
	  })

	  vim.keymap.set({"v"}, "<leader>t<F" .. i .. ">", function()
	    vim.cmd("ToggleTermSendVisualSelection " .. i)
	  end, {
	    noremap = true,
	    silent = true,
	    desc = "Send selected to terminal " .. i
	  })
	end
	'';

	keymaps = [
		{
			mode = [
				"n"
				"v"
			];
			key = "<leader>ta";
			action = "<Cmd>ToggleTermToggleAll<CR>"; # :set autochdir<CR>
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
