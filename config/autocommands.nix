{
	autoCmd = [
		# Vertically center document when entering insert mode
		{
			event = "InsertEnter";
			command = "norm zz";
		}

		# Open help in a vertical split
		{
			event = "FileType";
			pattern = "help";
			command = "wincmd L";
		}

		# Enable spellcheck for some filetypes
		{
			event = "FileType";
			pattern = [
				"tex"
				"latex"
				"markdown"
			];
			command = "setlocal spell spelllang=en | set conceallevel=1 | set et | set linebreak | set textwidth=120 | set nowrap";
		}

		{
			event = "FileType";
			pattern = [ "c" "h"];
			command = "set tags=./tags,tags,/opt/toolchains/zephyr/tags,/home/wired/esp/esp-idf/tags;";
		}

		{
			event = "TermOpen";
			pattern = "*";
			command = "setlocal nospell";
		}

		{
			event = [
				"BufNewFile"
			];
			pattern = [
				"*.h"
			];
			callback = { __raw =  ''
				function()
				local filename = vim.fn.expand("%:t:r"):upper()
				local include_guard = "__" .. filename .. "_H__"
				local boilerplate = string.format(
				[[
#if !defined(%s)
#define %s 1

#ifdef __cplusplus
extern "C" {
#endif
/**********************************************************
* Include files
**********************************************************/

/**********************************************************
* Macro definitions
**********************************************************/

/**********************************************************
* Type definitions
**********************************************************/

/**********************************************************
* Variable declarations
**********************************************************/

/**********************************************************
* Function Prototypes
**********************************************************/

/**********************************************************
* Functions
**********************************************************/

#ifdef __cplusplus
}
#endif

#endif /* %s */
]], include_guard, include_guard, include_guard)
				vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
				end
				'';
			};
		}
		{
			event = [
				"BufNewFile"
			];
			pattern = [
				"*.c"
			];
			callback = {__raw = ''
				function()
				local boilerplate = [[
/**********************************************************
* Include files
**********************************************************/

/**********************************************************
* Macro definitions
**********************************************************/

/**********************************************************
* Type definitions
**********************************************************/

/**********************************************************
* Variable declarations
**********************************************************/

/**********************************************************
* Function Prototypes
**********************************************************/

/**********************************************************
* Functions
**********************************************************/
]]
				vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
				end
			'';
			};
		}
	];
}
