{
	plugins.mini = {
		enable = true;
		modules = {
			#animate = { };
			surround = { };
			# icons = { };
			hipatterns = {
				highlighters = {
					hex_color.__raw = ''require("mini.hipatterns").gen_highlighter.hex_color()'';
				};
			};
		};
	};
}
