{ self, ... }:
{
	plugins.snacks = {
		enable = true;
		settings = {
			bufdelete.enabled = true;
			input.enabled = true;
			term.enabled = true;
			scroll.enabled = true;
			animate.enabled = true;
		};
	};

	imports = [
		./dashboard.nix
		./gitbrowse.nix
		./indent.nix
		./lazygit.nix
		./notifier.nix
		./picker.nix
	];
}
