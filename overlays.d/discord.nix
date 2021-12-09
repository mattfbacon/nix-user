_: super:
{
	discord-canary = super.discord-canary.overrideAttrs (old: {
		src = builtins.fetchTarball {
			url = "https://discordapp.com/api/download/canary?platform=linux&format=tar.gz";
			sha256 = "0j0db1wq97m6jcdfak1a4q130hpnmm3nsjmxn57fs7qhnm386588";
		};
		version = "0.0.131";
		installPhase = ''
			gappsWrapperArgs+=("--add-flags" ${super.lib.escapeShellArg "--ozone-platform=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer"})
		'' + old.installPhase;
	});
}
