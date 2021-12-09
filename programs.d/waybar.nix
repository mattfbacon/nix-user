{ ... }:
let
	bar = {
		layer = "top";
		position = "top";
		modules-left = [
			"sway/workspaces"
			"sway/mode"
		];
		modules-center = [];
		modules-right = [
			"sway/window"
			"pulseaudio"
			"memory"
			"disk"
			"cpu"
			"battery"
			"clock"
			"tray"
		];
		modules = {
			"sway/workspaces" = {
				disable-scroll = true;
				all-outputs = false;
			};
			"tray" = {
				"icon-size" = 16;
				"spacing" = 3;
			};
		};
	};
in {
	programs.waybar = {
		enable = true;
		settings = [
			bar
		];
		systemd.enable = false;
		style = ''
			* { all: unset; }
			#waybar {
				font-family: monospace;
				font-size: 12px;
				border: none;
				border-radius: 0;
				color: white;
				background: transparent;
			}
			#waybar > box {
				padding: 4px;
			}
			#workspaces button {
				padding: 0 6px;
				color: rgba(255,255,255,0.5);
			}
			#workspaces button.visible {
				color: white;
				background: rgba(108, 91, 123, 0.6);
			}
			'';
	};
}
