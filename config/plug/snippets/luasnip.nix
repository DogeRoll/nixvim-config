{ pkgs, ... }:
{
	plugins.luasnip = {
		enable = true;
		settings = {
			enable_autosnippets = true;
			store_selection_keys = "<Tab>";
		};
		fromVscode = [
			{
				lazyLoad = true;
				paths = "${pkgs.vimPlugins.friendly-snippets}";
			}
		];
		luaConfig.content = ''
	local ls = require("luasnip")
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

	ls.add_snippets("c", {
		s("for", fmt([[
		for (int {} = 0; {} < {}; {}++) {{
			{}
		}}
	  ]], { i(1, "i"), i(2, "i"), i(3, "n"), i(4, "i"), i(5, "// loop body") })),

		s("printf", fmt([[ printf("{}\\n", {}); ]], { i(1, "Message"), i(2) })),
		s("dox", fmt([[
/**
 * @brief {}
 * 
 * @param {} 
 * @return {}
 */
]], { i(1, "Description"), i(2, "param"), i(3, "return") }))
	})
	'';
	};
}
