{ pkgs, config, ... }:
{
	gtk = {
		enable = true;
		font = {
			name = "sans-serif";
		};
		gtk2 = {
			configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
		};
		gtk3 = {
			bookmarks = [
				# "file://${config.xdg.configHome}/Documents"
			];
		};
		iconTheme = {
			package = pkgs.gnome.gnome_themes_standard;
			name = "Adwaita";
		};
		theme = {
			package = pkgs.arc-theme;
			name = "Arc";
		};
	};
	home.packages = with pkgs; [ gsettings-desktop-schemas ];
}
