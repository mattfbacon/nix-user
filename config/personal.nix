rec {
	email = "matt@felle.nz";
	name = nick: rec {
		first = if nick then "Matt" else "Matthew";
		last = "Fellenz";
		full = "${first} ${last}";
	};
	discord = "mattf_#6820";
	username = "matt";
	github = "mattfbacon";
	githubId = 58113890;
}
