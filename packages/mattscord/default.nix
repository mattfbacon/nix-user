{ stdenv, lib, lessc, gnumake, fetchFromGitHub }:
let
	personal = import ../../config/personal.nix;
	owner = personal.github;
	repo = "discord-theme";
in stdenv.mkDerivation rec {
	pname = "mattscord";
	version = "0eabb038917178390f02224dd16a65acecb74d2a";
	src = fetchFromGitHub {
		inherit owner;
		inherit repo;
		rev = "0eabb038917178390f02224dd16a65acecb74d2a";
		sha256 = "MUtg47cM8OSsFe4TFiEQKkKPZaOAEgPdJv9UiSr7HOA=";
	};
	nativeBuildInputs = [ lessc gnumake ];
	buildPhase = ''
		runHook preBuild
		${gnumake}/bin/make
		runHook postBuild
	'';
	installPhase = ''
		runHook preInstall
		mkdir -p $out
		cp powercord_manifest.json $out/
		cp -R dist $out/
		runHook postInstall
	'';
	meta = with lib; {
		description = "${(personal.name true).first}'s Discord Theme";
		longDescription = "This is a Discord CSS injection stylesheet for my personal Discord theme. It's similar to Gruvbox Light or Solarized Light, and is based on the Noctis Lux VS Code theme.";
		homepage = src.homepage;
		license = licenses.mit;
		maintainers = [{
			email = personal.email;
			github = owner;
			name = (personal.name true).full;
			githubId = personal.githubId;
		}];
		platforms = platforms.all;
	};
}
