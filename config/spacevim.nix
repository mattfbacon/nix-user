{ bootstrap_name, ... }:
{
	spacevim = {
		custom_plugins = [{
			merged = false;
			name = "lilydjwg/colorizer";
		}];
		layers = [
			{ name = "default"; }
			{
				enable = true;
				name = "colorscheme";
			}
			{ name = "fzf"; }
			{
				default_height = 30;
				default_position = "top";
				name = "shell";
			}
			{ name = "edit"; }
			{ name = "VersionControl"; }
			{ name = "git"; }
			{
				auto-completion-return-key-behavior = "complete";
				auto-completion-tab-key-behavior = "cycle";
				autocomplete_method = "coc";
				name = "autocomplete";
			}
			{ name = "lang#ruby"; }
			{ name = "lang#nix"; }
			{ name = "lang#java"; }
			{ name = "lang#kotlin"; }
			{ name = "lang#sh"; }
			{ name = "lang#html"; }
		];
		options = {
			buffer_index_type = 4;
			colorscheme = "gruvbox";
			colorscheme_bg = "dark";
			enable_guicolors = true;
			enable_statusline_mode = true;
			enable_tabline_filetype_icon = true;
			statusline_separator = "arrow";
			timeoutlen = 500;
			bootstrap_after = "${bootstrap_name}";
		};
	};
	rc = ''
		function! ${bootstrap_name}() abort
			set noet ts=2 sts=2 sw=2 mouse=a list
		endfunction
	'';
}
