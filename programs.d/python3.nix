{ pkgs, ... }:
{
	nixpkgs.overlays = [
		(_: super: {
			python3 = super.python39;
		})
	];
	home.packages = with pkgs; [
		python3
	];
}
