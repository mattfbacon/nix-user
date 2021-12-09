{ pkgs, ... }:
let
	personal = import ../config/personal.nix;
	git = pkgs.git.override { withLibsecret = true; };
in {
	programs.git = {
		package = git;
		enable = true;
		aliases = {
			co = "checkout";
			c = "commit";
			a = "add";
		};
		ignores = [ "*~" "*.swp" ".vscode" ".ccls-cache" ];
		lfs = {
			enable = true;
		};
		userName = (personal.name true).full;
		userEmail = personal.email;
		extraConfig = {
			credential.helper = "${git}/bin/git-credential-libsecret";
			init.defaultBranch = "main";
		};
		signing = {
			signByDefault = true;
			key = "Matt Fellenz (Verification of authenticity for public works)";
		};
	};
}
