# copied from nixpkgs lol
{ ripgrep
, git
, fzf
, makeWrapper
, fetchFromGitHub
, pkgs
, lib
, stdenv
, formats
, runCommand
, spacevim_config
, neovim
, ...
}:

let
	spacevim_config_toml = spacevim_config.spacevim;
	spacevim_custom_rc = spacevim_config.rc;
	neovim-customized = neovim;
	format = formats.toml { };
	spacevimdir = runCommand "SpaceVim.d" { } ''
		mkdir -p $out
		cp ${format.generate "init.toml" spacevim_config_toml} $out/init.toml
		mkdir -p $out/autoload
		cp ${pkgs.writeText "spacevim_custom_rc" spacevim_custom_rc} $out/autoload/myspacevim.vim
	'';
in
stdenv.mkDerivation rec {
	pname = "spacevim";
	version = "1.8.0";
	src = fetchFromGitHub {
		owner = "SpaceVim";
		repo = "SpaceVim";
		rev = "v${version}";
		hash = "sha256:11snnh5q47nqhzjb9qya6hpnmlzc060958whqvqrh4hc7gnlnqp8";
	};

	nativeBuildInputs = [ makeWrapper neovim-customized ];
	buildInputs = [ neovim-customized ];

	buildPhase = ''
		runHook preBuild
		# generate the helptags
		env HOME=$(pwd) ${neovim}/bin/nvim -u NONE -c "helptags $(pwd)/doc" -c q
		runHook postBuild
	'';

	patches = [
		# Don't generate helptags at runtime into read-only $SPACEVIMDIR
		./helptags.patch
	];

	installPhase = ''
		runHook preInstall
		mkdir -p $out/bin
		cp -r $(pwd) $out/SpaceVim
		# trailing slash very important for SPACEVIMDIR
		makeWrapper "${neovim-customized}/bin/nvim" "$out/bin/spacevim" \
				--add-flags "-u $out/SpaceVim/vimrc" --set SPACEVIMDIR "${spacevimdir}/" \
				--prefix PATH : ${lib.makeBinPath [ fzf git ripgrep]}
		runHook postInstall
	'';

	meta = with lib; {
		description = "Modern Vim distribution";
		longDescription = ''
			SpaceVim is a distribution of the Vim editor that’s inspired by spacemacs.
		'';
		homepage = "https://spacevim.org/";
		license = licenses.gpl3Plus;
		maintainers = [ maintainers.fzakaria ];
		platforms = platforms.all;
	};
}
