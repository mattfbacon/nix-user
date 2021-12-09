{ pkgs, ... }:
{
	xdg = {
		enable = true;
	};
	home.packages = with pkgs; [
		xdg-desktop-portal
		xdg-desktop-portal-wlr
	];
}
