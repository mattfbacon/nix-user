{ lib, ... }:
let
	theme = import ../config/theme.nix;
	color_keys = [ "foreground" "background" ] ++ builtins.genList (x: "color${builtins.toString x}") 16;
	color_conf = lib.getAttrs color_keys theme;
in {
	programs.kitty = {
		enable = true;
		settings = {
			wheel_scroll_multiplier = "5.0";
			enable_audio_bell = false;
			font_size = "9.5";
		} // color_conf;
		font = null;
		keybindings = {};
	};
}
