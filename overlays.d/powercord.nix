let
	powercord-overlay = import (builtins.fetchTarball "https://github.com/LavaDesu/powercord-overlay/archive/master.tar.gz");
in
	powercord-overlay.overlay
