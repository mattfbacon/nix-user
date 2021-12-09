{ pkgs, ... }:
{
	nixpkgs.config = {
		allowUnfree = true;
	};
	home.packages = [(
		pkgs.discord-plugged.override {
			plugins = [];
			themes = with pkgs.powercord-themes; [ mattscord ];
		}
	)];
}
