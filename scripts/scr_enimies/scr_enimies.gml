function EnemyState () constructor {
	static Die = function (_obj) {
		AlterEnemyDefault(_obj, 0);
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					_obj.sprite_index = spr_death_die;
					AlterEnemyDefault(_obj, 0, 0);
			}
		}
		else if (_obj.identity == Identity.Minion) {
			new ControllerSprite(_obj).AssignSpriteToObject();
			
			switch (_obj.name) {
				case Minion.Goblin:
					break;
				case Minion.Slime:
					break;
				case Minion.Skeleton:
					break;
				case Minion.Mushroom:
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1)) {
			obj_player.status.Level.XP += irandom_range(15, 35);
			
			if (_obj.name == Boss.Death)
				obj_room.deathIsDead = true;
			
			instance_destroy(_obj);
		}
	}
	static Hit = function (_obj) {
		AlterEnemyDefault(_obj, 0);
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					_obj.sprite_index = spr_death_hit;
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			new ControllerSprite(_obj).AssignSpriteToObject();
			
			switch (_obj.name) {
				case Minion.Goblin:
					break;
				case Minion.Slime:
					break;
				case Minion.Skeleton:
					break;
				case Minion.Mushroom:
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1))
			AlterEnemyDefault(_obj, 0,,, EntityState.Idle, true);
	}
	static Idle	= function (_obj) {
		new ControllerSprite(_obj).AssignSpriteToObject();
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Goblin:
					break;
				case Minion.Slime:
					break;
				case Minion.Skeleton:
					break;
				case Minion.Mushroom:
					break;
			}
		}
		
		AlterEnemyDefault(_obj, 0);
	}
	static Walk	= function (_obj) {
		new ControllerSprite(_obj).AssignSpriteToObject();
		
		if (_obj.speed_horizontal == 0 && instance_exists(_obj) && distance_to_object(obj_player) > _obj.dist_aggro) {
			_obj.speed_horizontal = _obj.speed_horizontal_max * irandom_range(-1, 1);
		}
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Goblin:
					break;
				case Minion.Slime:
					break;
				case Minion.Skeleton:
					break;
				case Minion.Mushroom:
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1))
			AlterEnemyDefault(_obj, 0,,, EntityState.Idle, true);
	}
	static Attack = function (_obj) {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					if (!_obj.attacking) {
						_obj.sprite_index = choose(spr_death_combat_first, spr_death_combat_second);
						
						_obj.attacking = true;
					}
			}
		}
		else if (_obj.identity == Identity.Minion) {
			new ControllerSprite(_obj).AssignSpriteToObject();
			
			switch (_obj.name) {
				case Minion.Goblin:
					break;
				case Minion.Slime:
					break;
				case Minion.Skeleton:
					break;
				case Minion.Mushroom:
					break;
			}
		}
		
		if (new ControllerSprite(_obj).ListenerSpriteIndex(1)) {
			AlterEnemyDefault(_obj,,,, EntityState.Idle, true);
			
			new Utils(_obj).SetTimer(1);
			
			_obj.attacking = false;
		}
	}
	static Cutscene	= function (_obj) {
		new ControllerSprite(_obj).AssignSpriteToObject();
		
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
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
		
		if (_obj.name == Minion.Slime) {
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
		else if (_obj.name == Boss.Death) {
			draw_rectangle_color(
				_obj.x - 25,
				_obj.y - ((_obj.sprite_height) - 80) - 20,
				_obj.x + 25,
				_obj.y - ((_obj.sprite_height) - 80) - 30,
				c_gray, c_gray, c_gray, c_gray,
				false
			);
		
			draw_rectangle_color(
				_obj.x - 25,
				_obj.y - ((_obj.sprite_height) - 80) - 20,
				_obj.x - 25 + wLifeBackground,
				_obj.y - ((_obj.sprite_height) - 80) - 30,
				c_red, c_red, c_red, c_red,		
				false
			);
		
			draw_rectangle_color(
				_obj.x - 25,
				_obj.y - ((_obj.sprite_height) - 80) - 20,
				_obj.x - 25 + wLife,
				_obj.y - ((_obj.sprite_height) - 80) - 30,
				colorBar, colorBar, colorBar, colorBar,
				false
			);
		}
		else {
			draw_rectangle_color(
				_obj.x - 25,
				_obj.y - ((_obj.sprite_height / 2) - 40) - 20,
				_obj.x + 25,
				_obj.y - ((_obj.sprite_height / 2) - 40) - 30,
				c_gray, c_gray, c_gray, c_gray,
				false
			);
		
			draw_rectangle_color(
				_obj.x - 25,
				_obj.y - ((_obj.sprite_height / 2) - 40) - 20,
				_obj.x - 25 + wLifeBackground,
				_obj.y - ((_obj.sprite_height / 2) - 40) - 30,
				c_red, c_red, c_red, c_red,		
				false
			);
		
			draw_rectangle_color(
				_obj.x - 25,
				_obj.y - ((_obj.sprite_height / 2) - 40) - 20,
				_obj.x - 25 + wLife,
				_obj.y - ((_obj.sprite_height / 2) - 40) - 30,
				colorBar, colorBar, colorBar, colorBar,
				false
			);
		}
	}
}