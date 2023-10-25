// @Timer
timer = -1;

// @Steps
steps	 = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Rounds.Step;
stepsAll = 4;

// @Settings
started	  = false;
completed = false;
nextRoom  = false;

enemiesDied  = 0; 
spawned		 = false;

porcentageAtual = 0;

// @Enemies Numbers
//limit = [12, 5, 7, 8];
limit = [1, 1, 1, 1];