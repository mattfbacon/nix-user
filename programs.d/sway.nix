{ lib, pkgs, ... }:
let
	inherit (lib) mapAttrs' mapAttrs;
	modifier = "Mod4";
	make_launchers = mapAttrs (_: value: "exec ${value}, mode default");
	make_brave_cmd = { profile ? "Default", incognito ? false }: "brave ${lib.optionalString incognito "--incognito"} --profile-directory=${lib.escapeShellArg profile}";
	modes = {
		"o" = {
			name = "applaunch";
			keybindings = make_launchers {
				"b" = make_brave_cmd {};
				"shift+b" = make_brave_cmd { incognito = true; };
				"s" = make_brave_cmd { profile = "School"; };
				"alt+b" = make_brave_cmd{ profile = "College"; };
				"d" = "DiscordCanary";
			};
			exit = true;
		};
	};
in {
	wayland.windowManager.sway = {
		enable = true;
		config = {
			inherit modifier;
			bars = [];
			floating = {
				criteria = [
					{ class = "applauncher"; }
				];
				inherit modifier;
				titlebar = true;
			};
			focus = {
				forceWrapping = false;
				followMouse = "always";
				mouseWarping = true;
				newWindow = "urgent";
			};
			gaps = {
				smartBorders = "on";
			};
			input = {
				"*" = {
					xkb_layout = "us";
					xkb_variant = "dvorak";
				};
				"type:touchpad" = {
					natural_scroll = "enable";
				};
			};
			keybindings = lib.mkOptionDefault (
				lib.mapAttrs'
					(key: { name, ... }: lib.nameValuePair "${modifier}+${key}" "mode ${name}")
					modes
			);
			menu = "$TERMINAL --class=applauncher sh -c '${pkgs.dmenu}/bin/dmenu_path | sort -u | fzf --layout=reverse | xargs -r swaymsg -t command exec'";
			modes = lib.mkOptionDefault (
				lib.mapAttrs'
					(key: { name, keybindings, exit, ... }:
						lib.nameValuePair
							name
							(keybindings // (lib.optionalAttrs exit (
								let do_exit = "mode default"; in {
									Escape = do_exit;
									Return = do_exit;
									"${modifier}+${key}" = do_exit;
								}
							)))
					)
					modes
			);
			output = {
				eDP-1 = {
					pos = "0 0";
					scale = "2";
				};
				DP-1 = {
					pos = "1920 0";
					scale = "2";
				};
				DP-3 = {
					pos = "3840 0";
					scale = "1";
					transform = "270";
				};
			};
			startup = [
				{ command = "waybar"; }
				{ command = "systemctl --user start tray.target"; }
				{ command = "mako"; }
				{ command = "DiscordCanary"; }
			];
			terminal = "$TERMINAL";
			window = {
				border = 2;
				hideEdgeBorders = "both";
				titlebar = false;
			};
		};
	};
	systemd.user.targets = {
		tray = {
			Unit = {
				Description = "Tray is available for applets";
			};
		};
	};
}
