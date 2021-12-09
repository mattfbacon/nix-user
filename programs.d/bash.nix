{ pkgs, ... }:
{
	programs.bash = {
		enable = true;
		profileExtra = ''
			exec ${pkgs.fish}/bin/fish
		'';
	};
}
