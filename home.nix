{ pkgs, lib, ... }:
let
	personal = import ./config/personal.nix;
	getall = dir:
		let
			dir_contents_set = builtins.readDir dir;
			dir_contents_list = map (name: { inherit name; type = dir_contents_set.${name}; }) (lib.attrNames dir_contents_set);
			filtered_contents = builtins.filter (x: x.type == "regular" && lib.strings.hasSuffix ".nix" x.name) dir_contents_list;
		in map (x: dir + "/${x.name}") filtered_contents;
in {
	programs.home-manager = {
		enable = true;
	};

	nixpkgs.overlays = map (import) (getall ./overlays.d);

	home = rec {
		username = personal.username;
		homeDirectory = "/home/${username}";
		stateVersion = "21.05"; # don't change
		sessionVariables = rec {
			EDITOR = "neovim";
			VISUAL = EDITOR;
			TERMINAL = "kitty";
			NIX_AUTO_RUN = "1";
		};
	};

	# include all of the .nix files in programs.d
	imports = getall ./programs.d;
}
