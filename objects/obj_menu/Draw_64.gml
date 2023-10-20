if (room != rm_initial) {
	if (obj_room.state == EnvironmentState.Paused) {
		_ = selectedOption == undefined
			? new CreateMenu().InGame()
			: new CreateOptions().InGame();
	}
}
else {
	_ = selectedOption == undefined
		? new CreateMenu().Initial()
		: new CreateOptions().Initial();
}