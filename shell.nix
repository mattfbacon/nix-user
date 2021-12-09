{ pkgs ? import <nixpkgs> {}, ... }:
pkgs.mkShell {
	nativeBuildInputs = with pkgs; [
		jq
		fish
		nix-linter
	];
	shellHook = "exec fish";
}
