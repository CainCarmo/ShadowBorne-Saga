function MachineSprite () constructor {
	static Player = function () {
		switch (obj_player.state) {
			case EntityState.Die:
				return obj_player.class == PlayerClass.Warrior
					? spr_warrior_die
					: spr_wizard_die;
				break;
			case EntityState.Hit:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.mechanics.Warrior.Wield 
						? spr_warrior_hit_w 
						: spr_warrior_hit_s;
				}
				else
					return spr_wizard_hit;
				break;
			case EntityState.Dash:
				return obj_player.class == PlayerClass.Warrior
					? spr_warrior_dash
					: spr_wizard_dash;
				break;
			case EntityState.Idle:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.mechanics.Warrior.Wield 
						? spr_warrior_idle_w 
						: spr_warrior_idle_s;
				}
				else
					return spr_wizard_idle;
				break;
			case EntityState.Jump:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.speed_vertical > 0 
						? spr_warrior_fall 
						: spr_warrior_jump;
				}
				else {
					return obj_player.speed_vertical > 0 
						? spr_wizard_fall 
						: spr_wizard_jump;
				}
				break;
			case EntityState.Walk:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.mechanics.Warrior.Wield 
						? spr_warrior_walk_w 
						: spr_warrior_walk_s;
				}
				else
					return spr_wizard_walk;
				break;
			case EntityState.Wield:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.mechanics.Warrior.Wield 
						? spr_warrior_wield 
						: spr_warrior_sheathe;
				}
				else
					return _;
				break;
			case EntityState.Attack:
				var attackSprite = undefined;
				var attackSpriteHitBox = undefined;
				
				var WarriorSprites = function () {
					if (obj_player.hadGroundCollised) {
				        if (obj_player.mechanics.Warrior.ComboState) {
				            switch (obj_player.mechanics.Warrior.ComboIndex) {
				                case WarriorComboIndex.First:
				                    attackSprite = (obj_player.mechanics.Warrior.Wield == WarriorWeaponCombat.Hand)
				                        ? spr_warrior_combat_sg_second
				                        : spr_warrior_combat_wg_second;
										
				                    attackSpriteHitBox = (obj_player.mechanics.Warrior.Wield == WarriorWeaponCombat.Hand)
				                        ? spr_warrior_combat_sg_second_hb
				                        : spr_warrior_combat_wg_second_hb;
				                    break;
				                case WarriorComboIndex.Second:
				                    attackSprite = (obj_player.mechanics.Warrior.Wield == WarriorWeaponCombat.Hand)
				                        ? spr_warrior_combat_sg_third
				                        : spr_warrior_combat_wg_third;
										
				                    attackSpriteHitBox = (obj_player.mechanics.Warrior.Wield == WarriorWeaponCombat.Hand)
				                        ? spr_warrior_combat_sg_third_hb
				                        : spr_warrior_combat_wg_third_hb;
				                    break;
				            }
				        }
				        else {
				            attackSprite = (obj_player.mechanics.Warrior.Wield == WarriorWeaponCombat.Hand)
				                ? spr_warrior_combat_sg_first
				                : spr_warrior_combat_wg_first;
								
				            attackSpriteHitBox = (obj_player.mechanics.Warrior.Wield == WarriorWeaponCombat.Hand)
				                ? spr_warrior_combat_sg_first_hb
				                : spr_warrior_combat_wg_first_hb;
				        }
				    }
				    else {
				        var playerOriginCenter = obj_player.y - obj_player.sprite_height * 0.5;
        
				        switch (obj_player.mechanics.Warrior.Wield) {
				            case WarriorWeaponCombat.Hand:
				                attackSprite = spr_warrior_combat_sa;
				                attackSpriteHitBox = spr_warrior_combat_sa_hb;
				                break;
				            case WarriorWeaponCombat.Sword:
				                attackSprite = (playerOriginCenter >= mouse_y)
				                    ? spr_warrior_combat_wa_above
				                    : spr_warrior_combat_wa_front;
									
				                attackSpriteHitBox = (playerOriginCenter >= mouse_y)
				                    ? spr_warrior_combat_wa_above_hb
				                    : spr_warrior_combat_wa_front_hb;
				                break;
				        }
				    }
    
				    return [attackSprite, attackSpriteHitBox];
				}
				var WizardSprites = function () {
					return [spr_wizard_combat_first, spr_wizard_combat_first];
				}
				
				return obj_player.class == PlayerClass.Warrior
					? WarriorSprites()
					: WizardSprites();
				
				break;
			case EntityState.Dialog:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.mechanics.Warrior.Wield 
						? spr_warrior_idle_w 
						: spr_warrior_idle_s;
				}
				else
					return spr_wizard_idle;
				break;
			case EntityState.Cutscene:
				if (obj_player.class == PlayerClass.Warrior) {
					return obj_player.mechanics.Warrior.Wield 
						? spr_warrior_idle_w 
						: spr_warrior_idle_s;
				}
				else
					return spr_wizard_idle;
				break;
		}
	}
	
	static Boss = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityState.Die:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_die;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_cutscene;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_die
						break;
				}
			case EntityState.Hit:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_hit;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_hit;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_hit;
						break;
				}
			case EntityState.Idle:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_idle;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_fly;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_idle;
						break;
				}
				break;
			case EntityState.Walk:
				switch (_obj.name) {
					case Boss.Death:	
						stateSpr = spr_death_idle;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_fly;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_walk;
						break;
				}
			case EntityState.Chase:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_idle;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_fly;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_walk;
						break;
				}
				break;
			case EntityState.Attack:
				switch (_obj.name) {
					case Boss.Death:
						if (!_obj.attacking)
							stateSpr = choose(spr_death_combat_first, spr_death_combat_second);
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_combat;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_combat;
						break;
				}
			case EntityState.Cutscene:
				switch (_obj.name) {
					case Boss.Death:
						stateSpr = spr_death_idle;
						break;
					case Boss.DemonSkeleton:
						stateSpr = spr_demonSkeleton_cutscene;
						break;
					case Boss.KingSlime:
						stateSpr = spr_kingSlime_idle;
						break;
				}
				break;
		}
		
		return stateSpr;
	}
	
	static Minion = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityState.Die:
				switch (_obj.name) {
					case Minion.Hound:
						stateSpr = spr_hound_idle;
						break;
					case Minion.Goblin:
						stateSpr = spr_goblin_die;
						break;
					case Minion.Slime:
						stateSpr = spr_slime_death_idle;
						break;
					case Minion.Skeleton:
						stateSpr = spr_skeleton_die;
						break;
					case Minion.Mushroom:
						stateSpr = spr_mushroom_die;
						break;
				}
				break;
			case EntityState.Hit:
				switch (_obj.name) {
					case Minion.Hound:
						stateSpr = spr_hound_hit;
						break;
					case Minion.Goblin:
						stateSpr = spr_goblin_hit;
						break;
					case Minion.Slime:
						stateSpr = spr_slime_hit_idle;
						break;
					case Minion.Skeleton:
						stateSpr = spr_skeleton_hit;
						break;
					case Minion.Mushroom:
						stateSpr = spr_mushroom_hit;
						break;
				}
				break;
			case EntityState.Idle:
				switch (_obj.name) {
					case Minion.Hound:
						stateSpr = spr_hound_idle;
						break;
					case Minion.Goblin:
						stateSpr = spr_goblin_idle;
						break;
					case Minion.Slime:
						stateSpr = spr_slime_idle;
						break;
					case Minion.Skeleton:
						stateSpr = spr_skeleton_idle;
						break;
					case Minion.Mushroom:
						stateSpr = spr_mushroom_idle;
						break;
				}
				break;
			case EntityState.Walk:
				switch (_obj.name) {
					case Minion.Hound:
						stateSpr = spr_hound_walk;
						break;
					case Minion.Goblin:
						stateSpr = spr_goblin_run;
						break;
					case Minion.Slime:
						stateSpr = spr_slime_walk;
						break;
					case Minion.Skeleton:
						stateSpr = spr_skeleton_walk;
						break;
					case Minion.Mushroom:
						stateSpr = spr_mushroom_walk;
						break;
				}
				break;
			case EntityState.Attack:
				switch (_obj.name) {
					case Minion.Hound:
						stateSpr = spr_hound_combat;
						break;
					case Minion.Goblin:
						if (!_obj.attacking) {
							stateSpr = choose(spr_goblin_combat_first, spr_goblin_combat_second);
							
							_obj.attacking = true;
						}
						break;
					case Minion.Slime:
						stateSpr = spr_slime_walk;
						break;
					case Minion.Skeleton:
						if (!_obj.attacking) {
							stateSpr = choose(spr_skeleton_combat_first, spr_skeleton_combat_second);
							
							_obj.attacking = true;
						}
						break;
					case Minion.Mushroom:
						if (!_obj.attacking) {
							stateSpr = choose(spr_mushroom_combat_first, spr_mushroom_combat_second);
							
							_obj.attacking = true;
						}
						break;
				}
				break;
		}
		
		return stateSpr;
	}
	
	static NPC = function (_obj) {
		var stateSpr = undefined;
		
		switch (_obj.state) {
			case EntityState.Idle:
				switch (_obj.name) {
					case IdentiyNPC.Leoric:
						stateSpr = spr_leoric_idle;
						break;
					case IdentiyNPC.Starfeon:
						stateSpr = spr_starfeon_idle;
						break;
				}
				break;
			case EntityState.Dialog:
				switch (_obj.name) {
					case IdentiyNPC.Leoric:
						stateSpr = spr_leoric_idle;
						break;
					case IdentiyNPC.Starfeon:
						stateSpr = spr_starfeon_dialog;
						break;
				}
				break;
		}
		
		return stateSpr;
	}
	
	static Obelisk = function () {
		var stateSpr = undefined;
		
		switch (obj_obelisk.state) {
			case StructState.Disabled:
				stateSpr = spr_obelisk_disabled;
				break;
			case StructState.Activating:
				stateSpr = spr_obelisk_activating;
				break;
			case StructState.Active:
				stateSpr = spr_obelisk_active;
				break;
		}
		
		return stateSpr;
	}
	
	static Totem = function () {
		var stateSpr = undefined;
		
		switch (obj_totem.state) {
			case StructState.Disabled:
				stateSpr = spr_totem_disabled;
				break;
			case StructState.Activating:
				stateSpr = spr_totem_activating;
				break;
			case StructState.Active:
				stateSpr = spr_totem_active;
				break;
		}
		
		return stateSpr;
	}
}