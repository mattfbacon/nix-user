{ ... }:
{
	programs.starship = {
		enable = true;
		enableBashIntegration = true;
		enableFishIntegration = true;
		enableZshIntegration = false;
		settings = {
			add_newline = false;
			character = {
				success_symbol = "[>](bold green)";
				error_symbol = "[x](bold red)";
			};
			package.disabled = true;
			battery = {
				charging_symbol = " "; # none
				format = "[$symbol]($style)";
				display = [
					{ threshold = 10; style = "bold black bgred"; }
					{ threshold = 20; style = "bold red"; }
					{ threshold = 40; style = "bold yellow"; }
				];
			};
			cmd_duration = {
				disabled = false;
				min_time = 5000;
				format = "[t+](yellow)[$duration]($style)";
			};
			directory = {
				truncation_length = 10;
				truncate_to_repo = false;
				truncation_symbol = "...";
			};
			memory_usage = {
				disabled = false;
				threshold = 60;
				format = "[$ram_pct+$swap_pct]($style)";
			};
			shell = {
				disabled = false;
				fish_indicator = "x>";
				bash_indicator = "T";
				zsh_indicator = "Z";
				unknown_indicator = "?";
			};
			time = {
				disabled = false;
				format = "[$time]($style) ";
			};
			nix_shell = {
				disabled = false;
				symbol = "nix ";
			};
		};
	};
}
