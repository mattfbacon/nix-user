{ pkgs, ... }:
let
	inherit (builtins) toString;
	cursor = {
		name = pkgs.cursor-theme.iconsName;
		size = 32;
		package = pkgs.cursor-theme;
	};
in {
	home.packages = [ cursor.package ];
	gtk.gtk2.extraConfig = with cursor; ''
gtk-cursor-theme-name = "${name}"
gtk-cursor-theme-size = ${toString size}
'';
	gtk.gtk3.extraConfig = with cursor; {
		gtk-cursor-theme-name = name;
		gtk-cursor-theme-size = size;
	};
	xresources.properties = with cursor; {
		"Xcursor.theme" = name;
		"Xcursor.size" = size;
	};
	home.file.".Xdefaults".source = ~/.Xresources;
	wayland.windowManager.sway.config.seat.${"*"}.xcursor_theme = with cursor; "${name} ${toString size}";
}
