{ ... }:
let
	theme = import ../config/theme.nix;
in {
	programs.mako = {
		enable = true;
		actions = true;
		anchor = "top-right";
		width = 400;
		height = 150;
		font = "sans-serif 10";
		backgroundColor = theme.background;
		borderColor = theme.foreground;
		borderRadius = 3;
		borderSize = 1;
		defaultTimeout = 10 * 1000;
		layer = "overlay";
		margin = "10";
		maxVisible = -1;
		padding = "5";
		textColor = theme.foreground;
		maxIconSize = 32;
	};
}
