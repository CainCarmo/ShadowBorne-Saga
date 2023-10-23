function PlayerState () constructor {
	static Die = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Die();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Die();
				break;
		}
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(obj_player.image_number - 1))
			new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			new ControllerSprite(obj_player).StopIn(1);
	}
	static Hit = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Hit();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Hit();
				break;
		}
	}
	static Dash = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Dash();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Dash();
				break;
		}
		
		AlterPlayerDefault(obj_player.speed_horizontal + (obj_player.dashDistance * obj_player.scale_x));
	}
	static Idle	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Idle();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Idle();
				break;
		}
		
		if (obj_player.left != obj_player.right)
			AlterPlayerDefault(,,, EntityState.Walk);
		else if (obj_player.jump && obj_player.hadGroundCollised)
			AlterPlayerDefault(, -obj_player.speed_vertical_max,, EntityState.Jump, true)
		else if (obj_player.attack)
			AlterPlayerDefault(0, 0,, EntityState.Attack, true);
	}
	static Jump	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Jump();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Jump();
				break;
		}
		
		if (obj_player.hadGroundCollised)
			AlterPlayerDefault(0, 0,, EntityState.Idle, true);
		else if (obj_player.attack)
			AlterPlayerDefault(0, 0,, EntityState.Attack, true);
	}
	static Walk	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Walk();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Walk();
				break;
		}
		
		if (abs(obj_player.speed_horizontal) < .1)
			AlterPlayerDefault(0, 0,, EntityState.Idle);
		else if (obj_player.jump)
			AlterPlayerDefault(, -obj_player.speed_vertical_max,, EntityState.Jump);
		else if (obj_player.attack)
			AlterPlayerDefault(0, 0,, EntityState.Attack, true);
	}
	static Wield = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Wield();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Wield();
				break;
		}
	}
	static Attack = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Attack();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Attack();
				break;
		}
	}
	static Dialog = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Dialog();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Dialog();
				break;
		}
	}
	static Cutscene	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardState().Cutscene();
				break;
			case PlayerClass.Warrior:
				new WarriorState().Cutscene();
				break;
		}
	}
}

function AlterPlayerDefault (sx = undefined, sy = undefined, bulk = undefined, state = undefined, clearImageIndex = false) {
	obj_player.speed_horizontal = sx	== undefined ? obj_player.speed_horizontal : sx;
	obj_player.speed_vertical   = sy	== undefined ? obj_player.speed_vertical   : sy;
	obj_player.status.Bulk	    = bulk  == undefined ? obj_player.status.Bulk	   : bulk;
	obj_player.state			= state == undefined ? obj_player.state			   : state;
	
	if (clearImageIndex) obj_player.image_index = 0;
}

function DrawElementPlayer () constructor {
	life_temp = obj_player.status.Life.Atual;
	life_bg   = obj_player.status.Life.Atual;
	
	mana_temp = obj_player.status.Mana.Atual;
	mana_bg   = obj_player.status.Mana.Atual;
	
	stamina_temp = obj_player.status.Stamina.Atual;
	stamina_bg   = obj_player.status.Stamina.Atual;
	
	static LifeBar = function () {
		var wLife = (life_temp / obj_player.status.Life.Max) * 270;
		var wLifeBackground = (life_bg / obj_player.status.Life.Max) * 270;
		
		var colorBar = merge_color(c_red, c_lime, life_temp / obj_player.status.Life.Max)
		
		life_temp = lerp(life_temp, clamp(obj_player.status.Life.Atual, 0, obj_player.status.Life.Max), 0.1);
		life_bg   = lerp(life_bg, life_temp, 0.05);
		
		draw_rectangle_color (
			8   - 2,
			44  - 2,
			270 + 2,
			58  + 2,
			c_gray, c_gray, c_gray, c_gray,
			false
		);
		
		draw_rectangle_color (
			8,
			44,
			8  + wLifeBackground,
			58,
			c_red, c_red, c_red, c_red,
			false
		);
		
		draw_rectangle_color (
			8,
			44,
			8  + wLife,
			58,
			colorBar, colorBar, colorBar, colorBar,
			false
		);
		
		new DrawGUI()
			.Text(string(obj_player.status.Life.Atual) + "/" + string(ceil(obj_player.status.Life.Max)), 270 - 40, 8 + 10, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
	}
	static StaminaBar = function () {
		var wStamina = (stamina_temp / obj_player.status.Stamina.Max) * 270;
		var wStaminaBackground = (stamina_bg / obj_player.status.Stamina.Max) * 270;
		
		var colorBar = merge_color(c_orange, c_yellow, stamina_temp / obj_player.status.Stamina.Max)
		
		stamina_temp = lerp(stamina_temp, clamp(obj_player.status.Stamina.Atual, 0, obj_player.status.Stamina.Max), 0.1);
		stamina_bg   = lerp(stamina_bg, stamina_temp, 0.05);
		
		draw_rectangle_color (
			8   - 2,
			80  - 2,
			270 + 2,
			94  + 2,
			c_gray, c_gray, c_gray, c_gray,
			false
		);
		
		draw_rectangle_color (
			8,
			80,
			8  + wStaminaBackground,
			94,
			c_orange, c_orange, c_orange, c_orange,
			false
		);
		
		draw_rectangle_color (
			8,
			80,
			8  + wStamina,
			94,
			colorBar, colorBar, colorBar, colorBar,
			false
		);
		
		new DrawGUI()
			.Text(string(obj_player.status.Stamina.Atual) + "/" + string(ceil(obj_player.status.Stamina.Max)), 270 - 40, 100 + 20, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
	}
	static ManaBar = function () {
		var wMana = (mana_temp / obj_player.status.Mana.Max) * 270;
		var wManaBackground = (mana_bg / obj_player.status.Mana.Max) * 270;
		
		var colorBar = merge_color(c_blue, c_aqua, mana_temp / obj_player.status.Mana.Max)
		
		mana_temp = lerp(mana_temp, clamp(obj_player.status.Mana.Atual, 0, obj_player.status.Mana.Max), 0.1);
		mana_bg   = lerp(mana_bg, mana_temp, 0.05);
		
		draw_rectangle_color (
			8   - 2,
			80  - 2,
			270 + 2,
			94  + 2,
			c_gray, c_gray, c_gray, c_gray,
			false
		);
		
		draw_rectangle_color (
			8,
			80,
			8  + wManaBackground,
			94,
			c_blue, c_blue, c_blue, c_blue,
			false
		);
		
		draw_rectangle_color (
			8,
			80,
			8  + wMana,
			94,
			colorBar, colorBar, colorBar, colorBar,
			false
		);
		
		new DrawGUI()
			.Text(string(obj_player.status.Mana.Atual) + "/" + string(ceil(obj_player.status.Mana.Max)), 270 - 40, 100 + 20, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
	}
	static LevelBar = function () {
		var wGUI = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		draw_rectangle_color (
			(wGUI / 2) * .25,
			hGUI - 10,
			wGUI - (wGUI / 2) * .25,
			hGUI - 30,
			#000000, #000000, #000000, #000000,
			false	
		);
		
		draw_rectangle (
			(wGUI / 2) * .25,
			hGUI - 10,
			wGUI - (wGUI / 2) * .25,
			hGUI - 30,
			true
		);
		
		draw_rectangle_color (
			(wGUI / 2) * .25,
			hGUI - 10,
			(wGUI / 2) * .25 + ((obj_player.status.Level.XP/obj_player.status.Level.LimitXP) * (wGUI - (wGUI / 2) * .50)),
			hGUI - 30,
			c_lime, c_lime, c_lime, c_lime,
			false
		);
		
		draw_text (
			wGUI - (wGUI / 2) * .38, 
			hGUI - 75, "Level: " + string(obj_player.status.Level.Count)
		);
		draw_text(
			wGUI - (wGUI / 2) * .38, 
			hGUI - 55, "XP: " + string(obj_player.status.Level.XP) + "/" + string(obj_player.status.Level.LimitXP)
		);
	}
	
	static DeadView = function () {
		var wGUI = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
			draw_rectangle_color (
				0,
				hGUI,
				wGUI,
				0,
				c_black, c_black, c_black, c_black, 
				false
			);
			
			new Utils(obj_room).SetTimer(5);
		
			new DrawGUI()
				.Text("You Died", wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_red, fa_center, fa_middle);
			new DrawGUI()
				.Text("Voltando no ùltimo ponto em: " + string(round(obj_room.timer / room_speed)), wGUI - 420, hGUI - 30, 1, 1, ft_status,, true, c_black, fa_left, fa_top);
				
			if (obj_room.timer == 0) {
				obj_player.x = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local._x;
				obj_player.y = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local._y;
				
				obj_player.status.Life.Max = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Life.Max;
				obj_player.status.Life.Atual = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Life.Atual;
				obj_player.status.Life.Regen = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Life.Regen;
				
				obj_player.status.Stamina.Max = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Stamina.Max;
				obj_player.status.Stamina.Atual = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Stamina.Atual;
				obj_player.status.Stamina.Regen = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Stamina.Regen;
				
				obj_player.status.Mana.Max = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Mana.Max;
				obj_player.status.Mana.Atual = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Mana.Atual;
				obj_player.status.Mana.Regen = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Mana.Regen;
				
				obj_player.state = EntityState.Idle;
				
				obj_room.timer = -1;
			}
		}
	}
}

function DealDamage () {
	if (obj_player.timer == 0) {
		obj_player.timer = -1;
		obj_player.image_alpha = 1;
	}
	else if (obj_player.timer > 0) {
		if (obj_player.status.Life.Atual == 0) {
			obj_player.timer = -1;
			obj_player.image_alpha = 1;
			
			obj_player.state = EntityState.Die;
		}
		else
			new Utils(obj_player).SetTimer(2);
	}
}

function RegenStatus () {
	if (obj_player.status.Life.Atual < 100 && obj_player.status.Life.Atual - obj_player.status.Life.Regen > 100)
		obj_player.status.Life.Atual += (obj_player.status.Life.Atual - obj_player.status.Life.Regen) + obj_player.status.Life.Regen;
	else if (obj_player.status.Life.Atual < 100)
		obj_player.status.Life.Atual += obj_player.status.Life.Regen;
	
	if (obj_player.status.Mana.Atual < 100 && obj_player.status.Mana.Atual - obj_player.status.Mana.Regen > 100)
		obj_player.status.Mana.Atual += (obj_player.status.Mana.Atual - obj_player.status.Mana.Regen) + obj_player.status.Mana.Regen;
	else if (obj_player.status.Mana.Atual < 100)
		obj_player.status.Mana.Atual += obj_player.status.Mana.Regen;
	
	
	if (obj_player.status.Stamina.Atual < 100 && obj_player.status.Stamina.Atual - obj_player.status.Stamina.Regen > 100)
		obj_player.status.Stamina.Atual += (obj_player.status.Stamina.Atual - obj_player.status.Stamina.Regen) + obj_player.status.Stamina.Regen;
	else if (obj_player.status.Stamina.Atual < 100)
		obj_player.status.Stamina.Atual += obj_player.status.Stamina.Regen;
}

function ListenerLevel () {
	if (obj_player.status.Level.XP >= obj_player.status.Level.LimitXP) {
		obj_player.status.Level.Count++;
	
		if (obj_player.status.Level.Count >= 1 && obj_player.status.Level.Count <= 9) {
			obj_player.status.Level.LimitXP = 150;
			obj_player.status.Level.XP = 0;
			
			obj_player.status.Strenght.Atual += 2;
		}
		if (obj_player.status.Level.Count >= 10 && obj_player.status.Level.Count <= 19) {
			obj_player.status.Level.LimitXP = 300;
			obj_player.status.Level.XP = 0;
			
			obj_player.status.Strenght.Atual += 2;
		}
		if (obj_player.status.Level.Count >= 20 && obj_player.status.Level.Count <= 29) {
			obj_player.status.Level.LimitXP = 500;
			obj_player.status.Level.XP = 0;
			
			obj_player.status.Strenght.Atual += 2;
		}
		if (obj_player.status.Level.Count >= 30 && obj_player.status.Level.Count <= 39) {
			obj_player.status.Level.LimitXP = 1000;
			obj_player.status.Level.XP = 0;
			
			obj_player.status.Strenght.Atual += 2;
		}
		if (obj_player.status.Level.Count >= 40 && obj_player.status.Level.Count <= 49) {
			obj_player.status.Level.LimitXP = 1500;
			obj_player.status.Level.XP = 0;
			
			obj_player.status.Strenght.Atual += 2;
		}
		if (obj_player.status.Level.Count >= 50 && obj_player.status.Level.Count <= 59) {
			obj_player.status.Level.LimitXP = 2500;
			obj_player.status.Level.XP = 0;
			
			obj_player.status.Strenght.Atual += 2;
		}
	}
}