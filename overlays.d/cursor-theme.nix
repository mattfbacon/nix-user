_: super:
{
	cursor-theme = super.numix-cursor-theme.overrideAttrs (old: rec {
		iconsName = "Numix-Cursor-Light";
		installPhase = old.installPhase + ''
			ln -sr $out/share/icons/${super.lib.escapeShellArg iconsName} $out/share/icons/default
		'';
	});
}

