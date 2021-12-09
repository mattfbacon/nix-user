{ lib, ... }:
let
	map_add = addition: set: lib.genAttrs set (orig: "${orig} ${addition}");
in {
	programs.fish = {
		enable = true;
		shellAliases =
			{
				grep = "grep --color=auto";
				bc = "bc -l";
				wget = "wget -c";
				# safety nets
				rm = "rm -I --preserve-root";
			}
			// map_add "-i" [ "mv" "cp" "ln" ]
			// map_add "--preserve-root" [ "chmod" "chown" "chgrp" ];
		shellAbbrs = {
			ls = "exa";
		};
		shellInit = ''
			set -x fish_subprocess 1
		'';
		loginShellInit = "";
		interactiveShellInit = "";
		plugins = [];
		functions = {};
	};
}
