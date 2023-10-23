// @Timer
timer = -1;

// @Steps
steps	 = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Rounds.Step;
stepsAll = 2;

// @Settings
started	  = false;
completed = false;
nextRoom  = false;

enemiesDied  = 0; 
spawned		 = false;

porcentageAtual = 0;

// @Enemies Numbers
limit = [2, 2];