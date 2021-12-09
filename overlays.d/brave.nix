_: super:
{
	brave = super.callPackage ../packages/brave {
		withXorg = false;
		withWayland = true;
		commandLineArgs = "--ozone-platform=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer";
	};
}
