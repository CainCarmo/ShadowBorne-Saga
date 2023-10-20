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
					: _;
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
			case EntityState.Teleport:
				return obj_player.class == PlayerClass.Warrior
					? _
					: _;
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
						
						break;
				}
				break;
			case EntityState.Fly:
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
			case EntityState.Hit:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityState.Dash:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityState.Idle:
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
			case EntityState.Jump:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityState.Walk:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityState.Wield:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityState.Attack:
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
			case EntityState.Dialog:
				switch (_obj.name) {
					case Boss.Death:
						break;
					case Boss.DemonSkeleton:
						break;
					case Boss.KingSlime:
						break;
				}
				break;
			case EntityState.Cutscene:
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
			case EntityState.Die:
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
			case EntityState.Fly:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityState.Hit:
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
			case EntityState.Dash:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityState.Idle:
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
			case EntityState.Jump:
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
			case EntityState.Walk:
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
			case EntityState.Wield:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityState.Attack:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityState.Dialog:
				switch (_obj.name) {
					case SubBoss.EvilWizard:
						break;
					case SubBoss.Nightmare:
						break;
					case SubBoss.Primordial:
						break;
				}
				break;
			case EntityState.Cutscene:
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
			case EntityState.Fly:
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
			case EntityState.Hit:
				switch (_obj.name) {
					case Minion.Hound:
						
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						stateSpr = spr_slime_hit_idle;
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
			case EntityState.Dash:
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
			case EntityState.Idle:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						stateSpr = spr_slime_idle;
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
			case EntityState.Jump:
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
			case EntityState.Walk:
				switch (_obj.name) {
					case Minion.Hound:
						break;
					case Minion.Goblin:
						break;
					case Minion.Slime:
						stateSpr = spr_slime_walk;
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
			case EntityState.Attack:
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
			case EntityState.Cutscene:
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
		switch (_obj.state) {
			case EntityState.Idle:
				
				break;
			case EntityState.Dialog:
				
				break;
		}
	}
	
	static Obelisk = function () {
		switch (obj_obelisk.state) {
			case StructState.Disabled:
				return ;
				break;
			case StructState.Activating:
				return ;
				break;
			case StructState.Active:
				return ;
				break;
		}
	}
	
	static Totem = function () {
		switch (obj_totem.state) {
			case StructState.Disabled:
				return ;
				break;
			case StructState.Activating:
				return ;
				break;
			case StructState.Active:
				return ;
				break;
		}
	}
	
	static Chest = function () {
		switch (obj_chest.state) {
			case StockState.Closed:
				return ;
				break;
			case StockState.Open:
				return ;
				break
		}
	}
}