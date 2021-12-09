let
	spacevim_config = import ../config/spacevim.nix { bootstrap_name = "myspacevim#after"; };
in _: super: {
	spacevim = super.callPackage ../packages/spacevim { inherit spacevim_config; };
}
