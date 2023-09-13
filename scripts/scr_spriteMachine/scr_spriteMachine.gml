/// @function							  SpriteMachine(_obj_entity)
/// @description						  Atribui a sprite no objeto passado pelo seu estado (state)
/// @param {Asset.GMObject}   _obj_entity Objeto entidade (Herda de obj_entity)
/// @returns {Asset.GMSprite}			
function SpriteMachine (_obj_entity) {

	#region Player [Warrior] & [Wizard]
	var warriorSprites = function (_obj_entity) {
		switch (_obj_entity.state) {
			case State.Fly:
				return;
			case State.Die:
				return spr_warrior_die;
			case State.Hit:
				return _obj_entity.warriorStyleAttack == 0
					? spr_warrior_hit_sheathed
					: spr_warrior_hit_wielded;
			case State.Run:
				return spr_warrior_run;
			case State.Dash:
				return spr_warrior_dash;
			case State.Idle:
				return _obj_entity.warriorStyleAttack == 0
					? spr_warrior_idle_sheathed
					: spr_warrior_idle_wielded;
			case State.Jump:
				return _obj_entity.speed_vertical > 0
					? spr_warrior_fall
					: spr_warrior_jump;
			case State.Walk:
				return _obj_entity.warriorStyleAttack == 0
					? spr_warrior_walk_sheathed
					: spr_warrior_walk_wielded;
			case State.Climb:
				return ;
			case State.Wield:
				return _obj_entity.warriorStyleAttack == 0
					? spr_warrior_sheathe
					: spr_warrior_wield;
			case State.Attack:
				var attackSprite = undefined;
				
				switch (_obj_entity.warriorTypeAttack) {
					case WarriorTypeAttack.Break:
						if (_obj_entity.hadGroundCollised) 
							attackSprite = spr_warrior_break;
						else 
							attackSprite = _obj_entity.sprite_index;
						break;
					case WarriorTypeAttack.Normal:
						if (_obj_entity.hadGroundCollised) {
							if (_obj_entity.comboState) {
								switch (_obj_entity.comboIndex) {
									case WarriorComboIndex.First:
										attackSprite = _obj_entity.warriorStyleAttack == 0
											? spr_warrior_attack_sheathed_combo_1
											: spr_warrior_attack_mid_wielded_combo_1;
										break;
									case WarriorComboIndex.Second:
										attackSprite = _obj_entity.warriorStyleAttack == 0
											? spr_warrior_attack_sheathed_combo_2
											: spr_warrior_attack_mid_wielded_combo_2;
										break;
								}
							}
							else {
								attackSprite = _obj_entity.warriorStyleAttack == 0
									? spr_warrior_attack_sheathed
									: spr_warrior_attack_wielded;
							}
						}
						else {
							var playerOriginCenter = _obj_entity.y - _obj_entity.sprite_height * .5;
							
							switch (_obj_entity.warriorTypeAttack) {
								case WarriorStyleAttack.Hand:
									attackSprite = spr_warrior_attack_air_sheathed_floor;
									break;
								case WarriorStyleAttack.Sword:
									attackSprite = playerOriginCenter >= mouse_y
										? spr_warrior_attack_air_wielded_above
										: spr_warrior_attack_air_wielded_front
									break;
							}
						}
						break;
					case WarriorTypeAttack.JumpAttackSpecial:
						if (!_obj_entity.hadGroundCollised && _obj_entity.warriorStyleAttack == WarriorStyleAttack.Sword)
							attackSprite = spr_warrior_attack_air_wielded_floor;
						else 
							attackSprite = _obj_entity.sprite_index;
						break;
				}
				
				return attackSprite;
			case State.Cutscene:
				return ;
		}
	}
	
	var wizardSprites  = function (_obj_entity) {
	
	}
	#endregion
	
	#region Enimies
		
		#region Boss
		var deathSprites = function (_obj_entity) {
	
		}
	
		var kingSlimeSprites = function (_obj_entity) {
	
		}
	
		var demonSkeletonSprites = function (_obj_entity) {
	
		}
		#endregion
	
		#region MiniBoss
		var nightmareSprites = function (_obj_entity) {
	
		}
	
		var evilWizardSprites = function (_obj_entity) {
	
		}
	
		var primordialSprites = function (_obj_entity) {
	
		}
		#endregion
	
		#region Minion
		var houndSprites = function (_obj_entity) {

		}

		var slimeSprites = function (_obj_entity) {

		}

		var goblinSprites = function (_obj_entity) {

		}

		var evilEyeSprites = function (_obj_entity) {

		}

		var mushroomSprites = function (_obj_entity) {

		}

		var skeletonSprites = function (_obj_entity) {

		}	
		#endregion
		
	#endregion
	
	#region NPC
	var leoricSprites = function (_obj_entity) {
	
	} 
	#endregion
	
	if (_obj_entity.identity == Identity.Player) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				return warriorSprites(_obj_entity);
			case Class.Wizard:
				break;
			case Class.Rogue:
				break;
			case Class.Guard:
				break;
		}
	}
	else if (_obj_entity.identity == Identity.Enimies) {
		switch (_obj_entity) {
			#region Boss
			case Enimies.Death:
				return deathSprites(_obj_entity);
			case Enimies.KingSlime:
				return kingSlimeSprites(_obj_entity); 
			case Enimies.DemonSkeleton:
				return demonSkeletonSprites(_obj_entity);
			#endregion
			
			#region MiniBoss
			case Enimies.Nightmare:
				return nightmareSprites(_obj_entity);
			case Enimies.EvilWizard:
				return evilWizardSprites(_obj_entity);
			case Enimies.Primordial:
				return primordialSprites(_obj_entity);
			#endregion
			
			#region Minion
			case Enimies.Hound:
				return houndSprites(_obj_entity);
			case Enimies.Slime:
				return slimeSprites(_obj_entity);
			case Enimies.Goblin:
				return goblinSprites(_obj_entity);
			case Enimies.EvilEye:
				return evilEyeSprites(_obj_entity);
			case Enimies.Mushroom:
				return mushroomSprites(_obj_entity);
			case Enimies.Skeleton:
				return skeletonSprites(_obj_entity);
			#endregion
		}
	}
	else {
		switch (NPC) {
			case NPC.Leoric:
				return leoricSprites(_obj_entity);
		}
	}
}