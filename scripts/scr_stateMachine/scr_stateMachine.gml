function stateMachine(_obj_entity) {
	switch (_obj_entity.state) {
		case State.Idle:
			_ = _obj_entity.brood == Brood.Human
				? playerIdle(_obj_entity)
				: monsterIdle(_obj_entity);
				
			break;
		case State.Run:
			_ = _obj_entity.brood == Brood.Human
				? playerRun(_obj_entity)
				: monsterRun(_obj_entity);
				
			break;
		case State.Jump:
			_ = _obj_entity.brood == Brood.Human
				? playerJump(_obj_entity)
				: monsterJump(_obj_entity);
				
			break;
		case State.Fly:
			_ = _obj_entity.brood == Brood.Human
				? playerFly(_obj_entity)
				: monsterFly(_obj_entity);
				
			break;
		case State.Attack:
			_ = _obj_entity.brood == Brood.Human
				? playerAttack(_obj_entity)
				: monsterAttack(_obj_entity);
				
			break;
		case State.Hit:
			_ = _obj_entity.brood == Brood.Human
				? playerHit(_obj_entity)
				: monsterHit(_obj_entity);
				
			break;
		case State.Die:
			_ = _obj_entity.brood == Brood.Human
				? playerDie(_obj_entity)
				: monsterDie(_obj_entity);
				
			break;
		case State.Berseker:
			_ = _obj_entity.brood == Brood.Human
				? playerBerseker(_obj_entity)
				: monsterBerseker(_obj_entity);
				
			break;
		case State.Cutscene:
			_ = _obj_entity.brood == Brood.Human
				? playerCutscene(_obj_entity)
				: monsterCutscene(_obj_entity);
				
			break;
	}
}