function MachineSprite () constructor {
	static Player = function () {
		switch (obj_player.state) {
			case EntityStates.Die:
				if (obj_player.class == PlayerClass.Warrior) 
					return spr_warrior_die;
				else 
					return spr_wizard_die;
				
				break;
			case EntityStates.Hit:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.weapon == WarriorWeaponCombat.Hand ? spr_warrior_hit_s : spr_warrior_hit_w;
				else 
					return spr_wizard_hit;
				
				break;
			case EntityStates.Dash:
				if (obj_player.class == PlayerClass.Warrior) 
					return spr_warrior_dash;
				else
					return spr_wizard_dash;
				
				break;
			case EntityStates.Idle:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.weapon == WarriorWeaponCombat.Hand ? spr_warrior_idle_s : spr_warrior_idle_w;
				else 
					return spr_wizard_idle;
				
				break;
			case EntityStates.Jump:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.speed_vertical > 0 ? spr_warrior_fall : spr_warrior_jump;
				else
					return obj_player.speed_vertical > 0 ? spr_wizard_fall : spr_wizard_jump;
					
				break;
			case EntityStates.Walk:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.weapon == WarriorWeaponCombat.Hand ? spr_warrior_walk_s : spr_warrior_walk_w;
				else
					return spr_wizard_walk;
					
				break;
			case EntityStates.Wield:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.weapon == WarriorWeaponCombat.Hand ? spr_warrior_sheathe : spr_warrior_wield;
				
				break;
			case EntityStates.Attack:
				if (obj_player.class == PlayerClass.Warrior) {
					var attackSprite = undefined;
					
					if (obj_player.hadGroundCollised) {
						if (obj_player.comboState) {
							switch (obj_player.comboIndex) {
								case WarriorComboIndex.First:
									attackSprite = obj_player.weapon == WarriorWeaponCombat.Hand
										? spr_warrior_combat_sg_second
										: spr_warrior_combat_wg_second;
									break;
								case WarriorComboIndex.Second:
									attackSprite = obj_player.weapon == WarriorWeaponCombat.Hand
										? spr_warrior_combat_sg_third
										: spr_warrior_combat_wg_third;
									break;
							}
						}
						else {
							attackSprite = obj_player.weapon == WarriorWeaponCombat.Hand
								? spr_warrior_combat_sg_first
								: spr_warrior_combat_wg_first;
						}
					}
					else {
						var playerOriginCenter = obj_player.y - obj_player.sprite_height * .5;
							
						switch (obj_player.weapon) {
							case WarriorWeaponCombat.Hand:
								attackSprite = spr_warrior_combat_sa;
								break;
							case WarriorWeaponCombat.Sword:
								attackSprite = playerOriginCenter >= mouse_y
									? spr_warrior_combat_wa_above
									: spr_warrior_combat_wa_front;
								break;
						}
					}
					
					return attackSprite;
				}
				else
					return spr_wizard_combat_first;
				
				break;
			case EntityStates.Dialog:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.weapon == WarriorWeaponCombat.Hand ? spr_warrior_idle_s : spr_warrior_idle_w;
				else 
					return spr_wizard_idle;
					
				break;
			case EntityStates.Cutscene:
				if (obj_player.class == PlayerClass.Warrior)
					return obj_player.weapon == WarriorWeaponCombat.Hand ? spr_warrior_idle_s : spr_warrior_idle_w;
				else 
					return spr_wizard_idle;
					
				break;
		}
	}
	
	static Boss = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityStates.Die:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_die;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_cutscene;
						break;
					case Boss.KingSlime:
						
						break;
				}
				break;
			case EntityStates.Fly:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_fly;
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Hit:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Run:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Dash:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Idle:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_idle;
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_idle;
						break;
				}
				break;
			case EntityStates.Jump:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Walk:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Wield:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Attack:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_combat;
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Dialog:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityStates.Cutscene:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
		}
	}
	
	static SubBoss = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityStates.Die:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						stateSpr = spr_evilWizard_die;
						break;
					case SubBoss.Nightmare:
						stateSpr = spr_nightmare_idle;
						break;
					case SubBoss.Primordial:
						stateSpr = spr_primoridial_die;
						break;
				}
				break;
			case EntityStates.Fly:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Hit:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						stateSpr = spr_evilWizard_hit;
						break;
					case SubBoss.Nightmare:
						stateSpr = spr_nightmare_hit;
						break;
					case SubBoss.Primordial:
						stateSpr = spr_primoridial_hit;
						break;
				}
				break;
			case EntityStates.Run:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						stateSpr = spr_evilWizard_run;
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Dash:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Idle:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						stateSpr = spr_evilWizard_idle;
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						stateSpr = spr_primoridial_idle;
						break;
				}
				break;
			case EntityStates.Jump:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						stateSpr = _obj.speed_vertical > 0 ? spr_evilWizard_fall : spr_evilWizard_jump;
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Walk:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						stateSpr = spr_primoridial_walk;
						break;
				}
				break;
			case EntityStates.Wield:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Attack:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Dialog:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityStates.Cutscene:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
		}
		
		return stateSpr;
	}
	
	static Minion = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityStates.Die:
				switch (_obj.name) {
					case Minion.Hound:
						stateSpr = spr_hound_idle;
						break;
					case Minion.Goblin:
						stateSpr = spr_goblin_die;
						break;
					case Minion.Slime:
						stateSpr = spr_slime_idle;
						break;
					case Minion.EvilEye:
						stateSpr = spr_evilEye_die;
						break;
					case Minion.Skeleton:
						stateSpr = spr_skeleton_die;
						break;
					case Minion.Mushroom:
						stateSpr = spr_mushroom_die;
						break;
					case Minion.FireWorm:
						stateSpr = spr_fireworm_die;
						break;
				}
				break;
			case EntityStates.Fly:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						stateSpr = spr_evilEye_flying;
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Hit:
				switch (_obj.name) {
					case Minion.Hound:
						
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Run:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Dash:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Idle:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Jump:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Walk:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Wield:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Attack:
				switch (_obj.name) {
					case Minion.Hound:
						
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Dialog:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
			case EntityStates.Cutscene:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						break;
					case Minion.EvilEye:
						break;
					case Minion.Skeleton:
						break;
					case Minion.Mushroom:
						break;
					case Minion.FireWorm:
						break;
				}
				break;
		}
	}
	
	static NPC = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityStates.Idle:
				if (_obj.name == NPC.Leoric) {
					switch (_obj.stateNPC) {
						case NPCState.Idle:
							stateSpr = spr_leoric_idle;
							break;
						case NPCState.Appear:
							stateSpr = spr_leoric_appear;
							break;
						case NPCState.Disappear:
							stateSpr = spr_leoric_disappear;
							break;
					}
				}
				else if (_obj.name == NPC.Starfeon) {
					switch (_obj.stateNPC) {
						case NPCState.Idle:
							stateSpr = spr_starfeon_idle;
							break;
					}
				}
			case EntityStates.Dialog:
				if (_obj.name == NPC.Starfeon) 
					stateSpr = spr_starfeon_dialog;
				break;
		}
		
		return stateSpr;
	}
	
	static Obelisk = function () {
		var stateSpr = undefined;
		
		switch (obj_obelisk.state) {
			case StructsState.Disabled:
				stateSpr = spr_obelisk_disabled;
			case StructsState.Activating:
				stateSpr = spr_obelisk_activating;
			case StructsState.Active:
				stateSpr = spr_obelisk_active;
		}
		
		return stateSpr;
	}
	
	static Totem = function () {
		var stateSpr = undefined;
		
		switch (obj_totem.state) {
			case StructsState.Active:
				stateSpr = spr_totem;
		}
		
		return stateSpr;
	}
	
	static Chest = function () {
		var stateSpr = undefined;
		
		switch (obj_chest.state) {
			case StockState.Closed:
				stateSpr = spr_chest_closed;
			case StockState.Open:
				stateSpr = spr_chest_open;
		}
		
		return stateSpr;
	}
}