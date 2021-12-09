_: super:
let
	extensions = [];
in {
	vscodium = super.vscode-with-extensions.override {
		vscode = super.vscodium.overrideAttrs (old: {
			installPhase = ''
				gappsWrapperArgs+=("--add-flags" ${super.lib.escapeShellArg "--ozone-platform=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer"})
			'' + old.installPhase;
		});
		vscodeExtensions = extensions;
	};
}
