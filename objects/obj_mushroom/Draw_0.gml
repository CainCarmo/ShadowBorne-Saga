event_inherited();

// @Draw LifeBar  Enemy
if (objectAtual.identity != Identity.Player && objectAtual.identity != Identity.NPC) {
	enemiesBar.LifeBar()
}