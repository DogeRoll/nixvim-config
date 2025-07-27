{
pkgs,
lib,
...
}:
let
	 text = pkgs.writeShellScriptBin "text" # bash
		''
		#!/usr/bin/env sh
		echo -e "
     ┓  •   •     ┓        •		
┏┓┏┓┏┫  ┓┏  ┓┏┓  ╋┣┓┏┓  ┓┏┏┓┏┓┏┓	
┗┫┗┛┗┻  ┗┛  ┗┛┗  ┗┛┗┗   ┗┻┛┗┛ ┗		
 ┛									
"
	'';
in
	{
	plugins.snacks = {
		settings = {
			dashboard = {
				enabled = true;
				preset = {
					keys = [
						{
							icon = " ";
							key = "f";
							desc = "Find File";
							action = "<leader>ff";
						}
						{
							icon = " ";
							key = "n";
							desc = "New File";
							action = ":ene | startinsert";
						}
						{
							icon = " ";
							key = "/";
							desc = "Find Text";
							action = "<leader>fr";
						}
						{
							icon = " ";
							key = "s";
							desc = "Restore Session";
							action = ":lua require(\"persistence\").select()";
						}
						{
							icon = " ";
							key = "r";
							desc = "Recent Files";
							action = "<leader>fg";
						}
						{
							icon = "";
							key = "o";
							desc = "LazyGit";
							action = "<leader>gg";
						}
						{
							icon = " ";
							key = "q";
							desc = "Quit";
							action = ":qa";
						}
					];
				};
				sections = [
					{
						section = "terminal";
						cmd = "${lib.getExe text}; sleep .4";
						height = 25;
						padding = 1;
						align = "left";
					}
					{
						icon = " ";
						pane = 2;
						title = "Keymaps";
						section = "keys";
						padding = 1;
						indent = 3;
					}
					{
						icon = " ";
						pane = 2;
						title = "Recent Files";
						section = "recent_files";
						padding = 1;
						indent = 3;
					}
					{
						icon = " ";
						pane = 2;
						title = "Projects";
						section = "projects";
						padding = 1;
						indent = 3;
					}
					{
						pane = 2;
						icon = " ";
						title = "Git Status";
						section = "terminal";
						enabled.__raw = ''
			  Snacks.git.get_root() ~= nil
			  '';
						cmd = "${pkgs.hub}/bin/hub status --short --branch --renames";
						height = 5;
						padding = 1;
						ttl = 5 * 60;
						indent = 3;
					}
				];
			};
		};
	};
}
