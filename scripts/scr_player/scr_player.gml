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
			.Text(string(obj_player.status.Life.Atual) + "/" + string(obj_player.status.Life.Max), 270 - 40, 8 + 10, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
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
			.Text(string(obj_player.status.Stamina.Atual) + "/" + string(obj_player.status.Stamina.Max), 270 - 40, 100 + 20, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
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
			.Text(string(obj_player.status.Mana.Atual) + "/" + string(obj_player.status.Mana.Max), 270 - 40, 100 + 20, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
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
}