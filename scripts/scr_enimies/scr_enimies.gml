function EnemyState () constructor {
	static Die = function (_obj) {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					_obj.sprite_index = spr_death_die;
					new DeathState().Die();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Die();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Die();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			new ControllerSprite(_obj).AssignSpriteToObject();
			
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Die();
					break;
				case Minion.Goblin:
					new GoblinState().Die();
					break;
				case Minion.Slime:
					new SlimeState().Die();
					break;
				case Minion.Skeleton:
					new SkeletonState().Die();
					break;
				case Minion.Mushroom:
					new MushroomState().Die();
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1)) {
			obj_player.status.Level.XP += irandom_range(15, 35);
			
			instance_destroy(_obj);
		}
	}
	static Hit = function (_obj) {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					_obj.sprite_index = spr_death_hit;
					new DeathState().Hit();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Hit();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Hit();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			new ControllerSprite(_obj).AssignSpriteToObject();
			
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Hit();
					break;
				case Minion.Goblin:
					new GoblinState().Hit();
					break;
				case Minion.Slime:
					new SlimeState().Hit();
					break;
				case Minion.Skeleton:
					new SkeletonState().Hit();
					break;
				case Minion.Mushroom:
					new MushroomState().Hit();
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1))
			AlterEnemyDefault(_obj, 0,,, EntityState.Idle);
	}
	static Idle	= function (_obj) {
		new ControllerSprite(_obj).AssignSpriteToObject();
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					new DeathState().Idle();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Idle();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Idle();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Idle();
					break;
				case Minion.Goblin:
					new GoblinState().Idle();
					break;
				case Minion.Slime:
					new SlimeState().Idle();
					break;
				case Minion.Skeleton:
					new SkeletonState().Idle();
					break;
				case Minion.Mushroom:
					new MushroomState().Idle();
					break;
			}
		}
		
		AlterEnemyDefault(_obj, 0);
	}
	static Walk	= function (_obj) {
		new ControllerSprite(_obj).AssignSpriteToObject();
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					new DeathState().Walk();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Walk();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Walk();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Walk();
					break;
				case Minion.Goblin:
					new GoblinState().Walk();
					break;
				case Minion.Slime:
					new SlimeState().Walk();
					break;
				case Minion.Skeleton:
					new SkeletonState().Walk();
					break;
				case Minion.Mushroom:
					new MushroomState().Walk();
					break;
			}
		}
	}
	static Attack = function (_obj) {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					if (!_obj.attacking) {
						_obj.sprite_index = choose(spr_death_combat_first, spr_death_combat_second);
						
						_obj.attacking = true;
					}
					new DeathState().Attack();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Attack();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Attack();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			new ControllerSprite(_obj).AssignSpriteToObject();
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Attack();
					break;
				case Minion.Goblin:
					new GoblinState().Attack();
					break;
				case Minion.Slime:
					new SlimeState().Attack();
					break;
				case Minion.Skeleton:
					new SkeletonState().Attack();
					break;
				case Minion.Mushroom:
					new MushroomState().Attack();
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1)) {
			_obj.attacking = false;
			
			AlterEnemyDefault(_obj,,,, EntityState.Idle);
			
			new Utils(_obj).SetTimer(1);
		}
	}
	static Cutscene	= function (_obj) {
		new ControllerSprite(_obj).AssignSpriteToObject();
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					new DeathState().Cutscene();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Cutscene();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Cutscene();
					break;
			}
		}
	}
}

function AlterEnemyDefault (_obj, sx = undefined, sy = undefined, bulk = undefined, state = undefined, clearImageIndex = false) {
	_obj.speed_horizontal = sx	== undefined   ? _obj.speed_horizontal : sx;
	_obj.speed_vertical   = sy	== undefined   ? _obj.speed_vertical   : sy;
	_obj.status.Bulk	  = bulk  == undefined ? _obj.status.Bulk	   : bulk;
	_obj.state			  = state == undefined ? _obj.state			   : state;
	
	if (clearImageIndex) _obj.image_index = 0;
}

function DrawElementEnemy (_obj_entity) constructor {
	_obj = _obj_entity;
	
	life_temp = _obj.status.Life.Atual;
	life_bg   = _obj.status.Life.Atual;
	
	static LifeBar = function () {
		var wLife = (life_temp / _obj.status.Life.Max) * 50;
		var wLifeBackground = (life_bg / _obj.status.Life.Max) * 50;
		
		var colorBar = merge_color(c_red, c_lime, life_temp / _obj.status.Life.Max)
		
		life_temp = lerp(life_temp, clamp(_obj.status.Life.Atual, 0, _obj.status.Life.Max), 0.1);
		life_bg   = lerp(life_bg, life_temp, 0.05);
		
		draw_rectangle_color(
			_obj.x - 25,
			_obj.y - (_obj.sprite_height - 20) - 20,
			_obj.x + 25,
			_obj.y - (_obj.sprite_height - 20) - 30,
			c_gray, c_gray, c_gray, c_gray,
			false
		);
		
		draw_rectangle_color(
			_obj.x - 25,
			_obj.y - (_obj.sprite_height - 20) - 20,
			_obj.x - 25 + wLifeBackground,
			_obj.y - (_obj.sprite_height - 20) - 30,
			c_red, c_red, c_red, c_red,		
			false
		);
		
		draw_rectangle_color(
			_obj.x - 25,
			_obj.y - (_obj.sprite_height - 20) - 20,
			_obj.x - 25 + wLife,
			_obj.y - (_obj.sprite_height - 20) - 30,
			colorBar, colorBar, colorBar, colorBar,
			false
		);
	}
}