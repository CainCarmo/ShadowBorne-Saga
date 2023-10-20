function CreateOptions () constructor {
	static Initial = function () {
		switch (obj_menu.selectedOption) {
			case MenuInitialOptions.Continue:
				new OptionsInitial().Continue();
				break;
			case MenuInitialOptions.NewGame:
				new OptionsInitial().NewGame();
				break;
			case MenuInitialOptions.Credits:
				new OptionsInitial().Credits();
				break;
			case MenuInitialOptions.Close:
				new OptionsInitial().Close();
				break;
		}
	}
	static InGame = function () {
		switch (obj_menu.selectedOption) {
			case MenuInGameOptions.Continue:
				new OptionsInGame().Continue();
				break;
			case MenuInGameOptions.BackToHome:
				new OptionsInGame().BackToHome();
				break;
		}
	}
}