function stateSprite(_obj_entity) {
	
	#region Human Sprites
	var warriorSprites = function(_obj_entity) {
		switch (_obj_entity.state) {
			case State.Idle:
				return spr_warrior_idle_sheathed;
			case State.Run:
				return spr_warrior_run;
			case State.Jump:
				if (_obj_entity.speed_vertical > 0)
					return spr_warrior_fall;
				else
					return spr_warrior_jump;
			case State.Attack:
				if (_obj_entity.groundCollided) {
					if (_obj_entity.comboState) {
						return _obj_entity.comboIndex == Combo.First
							? spr_warrior_attack_mid_combo_first
							: spr_warrior_attack_mid_combo_second;
					}
					else
						return spr_warrior_attack_mid_normal;
				}
				else
					return spr_warrior_attack_air_floor
			case State.Hit:
				return spr_warrior_hit;
			case State.Die:
				return spr_warrior_die;
		}
	}
	
	var wizardSprites  = function(_obj_entity) {
		switch (_obj_entity.state) {
			case State.Idle:
				break;
			case State.Run:
				break;
			case State.Jump:
				break;
			case State.Attack:
				break;
			case State.Die:
				break;
		}
	}
	#endregion
	
	#region Monsters Sprites
	var evilEyeSprites  = function(_obj_entity) {
		switch (_obj_entity.state) {
			case State.Idle:
			case State.Fly:
				return spr_evilEye_flying;
			case State.Attack:
				if (_obj_entity.comboState) {
					return _obj_entity.comboIndex == Combo.First
						? spr_evilEye_attack_combo_first
						: spr_evilEye_attack_combo_second;
				}
				else
					return spr_evilEye_attack;
			case State.Hit:
				return spr_evilEye_hit;
			case State.Die:
				return spr_evilEye_die;
		}
	}
	
	var goblinSprites   = function(_obj_entity) {
		switch (_obj_entity.state) {
			case State.Idle:
				return spr_goblin_idle;
			case State.Run:
				return spr_goblin_run;
			case State.Attack:
				if (_obj_entity.comboState) {
					return _obj_entity.comboIndex == Combo.First
						? spr_goblin_attack_combo_first
						: spr_goblin_attack_combo_second;
				}
				else
					return spr_goblin_attack;
			case State.Hit:
				return spr_goblin_hit;
			case State.Die:
				return spr_goblin_die;
		}
	}
	
	var mushroomSprites = function(_obj_entity) {
		switch (_obj_entity.state) {
			case State.Idle:
				return spr_mushroom_idle;
			case State.Run:
				return spr_mushroom_run;
			case State.Attack:
				if (_obj_entity.comboState) {
					return _obj_entity.comboIndex == Combo.First
						? spr_mushroom_attack_combo_first
						: spr_mushroom_attack_combo_second;
				}
				else
					return spr_mushroom_attack;
			case State.Hit:
				return spr_mushroom_hit;
			case State.Die:
				return spr_mushroom_die;
		}
	}
	
	var skeletonSprites = function(_obj_entity) {
		switch (_obj_entity.state) {
			case State.Idle:
				return spr_skeleton_idle;
			case State.Run:
				return spr_skeleton_run;
			case State.Attack:
				if (_obj_entity.comboState) {
					return _obj_entity.comboIndex == Combo.First
						? spr_skeleton_attack_combo_first
						: spr_skeleton_attack_combo_second;
				}
				else
					return spr_skeleton_attack;
			case State.Hit:
				return spr_skeleton_hit;
			case State.Die:
				return spr_skeleton_die;
		}
	}
	#endregion
	
	#region Return Sprites
	
	// Valida a entidade da sprite e retorna a mesma.
	if (_obj_entity.brood == Brood.Human) {
		
		switch(_obj_entity.class) {
			case Class.Warrior:
				return warriorSprites(_obj_entity);
			case Class.Wizard:
				return wizardSprites(_obj_entity);
		}
	}
	else {
		switch(_obj_entity.brood) {
			case Brood.EvilEye:
				return evilEyeSprites(_obj_entity);
			case Brood.Goblin:
				return goblinSprites(_obj_entity);
			case Brood.Mushroom:
				return mushroomSprites(_obj_entity);
			case Brood.Skeleton:
				return skeletonSprites(_obj_entity);
		}
	}
	#endregion
}

function spriteProjectile(_obj_entity) {
	switch (_obj_entity.Brood) {
		case Brood.EvilEye:
			return spr_evilEye_attack_combo_projectile;
		case Brood.Goblin:
			return spr_goblin_attack_combo_bomb;
		case Brood.Mushroom:
			return spr_mushroom_attack_combo_projectile;
		case Brood.Skeleton:
			return spr_skeleton_attack_combo_sword;
	}
}

function spriteHitBox(_obj_entity) {
	
	#region Human Sprites
	var warriorSpritesHitBox = function(_obj_entity) {
		if (_obj_entity.comboState) {
			return _obj_entity.comboIndex == Combo.First
				? spr_warrior_attack_mid_combo_first
				: spr_warrior_attack_mid_combo_second;
		}
		else
			return spr_warrior_attack_mid_normal;
	}
	
	var wizardSpritesHitBox  = function(_obj_entity) {
		if (_obj_entity.comboState) {
			return _obj_entity.comboIndex == Combo.First
				? spr_warrior_attack_mid_combo_first
				: spr_warrior_attack_mid_combo_second;
		}
		else
			return spr_warrior_attack_mid_normal;
	}
	#endregion
	
	#region Monsters Sprites
	var evilEyeSpritesHitBox  = function(_obj_entity) {
		if (_obj_entity.comboState) {
			return _obj_entity.comboIndex == Combo.First
				? spr_warrior_attack_mid_combo_first
				: spr_warrior_attack_mid_combo_second;
		}
		else
			return spr_warrior_attack_mid_normal;
	}
	
	var goblinSpritesHitBox   = function(_obj_entity) {
		if (_obj_entity.comboState) {
			return _obj_entity.comboIndex == Combo.First
				? spr_warrior_attack_mid_combo_first
				: spr_warrior_attack_mid_combo_second;
		}
		else
			return spr_warrior_attack_mid_normal;
	}
	
	var mushroomSpritesHitBox = function(_obj_entity) {
		if (_obj_entity.comboState) {
			return _obj_entity.comboIndex == Combo.First
				? spr_warrior_attack_mid_combo_first
				: spr_warrior_attack_mid_combo_second;
		}
		else
			return spr_warrior_attack_mid_normal;
	}
	
	var skeletonSpritesHitBox = function(_obj_entity) {
		if (_obj_entity.comboState) {
			return _obj_entity.comboIndex == Combo.First
				? spr_warrior_attack_mid_combo_first
				: spr_warrior_attack_mid_combo_second;
		}
		else
			return spr_warrior_attack_mid_normal;
	}
	#endregion
	
	#region Return Sprites
	
	// Valida a entidade da sprite (Hitbox) e retorna a mesma.
	if (_obj_entity.brood == Brood.Human) {
		
		switch(_obj_entity.class) {
			case Class.Warrior:
				return warriorSpritesHitBox(_obj_entity);
			case Class.Wizard:
				return wizardSpritesHitBox(_obj_entity);
		}
	}
	else {
		switch(_obj_entity.brood) {
			case Brood.EvilEye:
				return evilEyeSpritesHitBox(_obj_entity);
			case Brood.Goblin:
				return goblinSpritesHitBox(_obj_entity);
			case Brood.Mushroom:
				return mushroomSpritesHitBox(_obj_entity);
			case Brood.Skeleton:
				return skeletonSpritesHitBox(_obj_entity);
		}
	}
	#endregion
}