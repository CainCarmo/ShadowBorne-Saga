function EnemyState () constructor {
	static Die = function (_obj) {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
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
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Die();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Die();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Die();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
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
				case Minion.EvilEye:
					new EvilEyeState().Die();
					break;
				case Minion.Skeleton:
					new SkeletonState().Die();
					break;
				case Minion.Mushroom:
					new MushroomState().Die();
					break;
				case Minion.FireWorm:
					new FireWormState().Die();
					break;
			}
		}
	}
	static Hit = function () {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
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
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Hit();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Hit();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Hit();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
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
				case Minion.EvilEye:
					new EvilEyeState().Hit();
					break;
				case Minion.Skeleton:
					new SkeletonState().Hit();
					break;
				case Minion.Mushroom:
					new MushroomState().Hit();
					break;
				case Minion.FireWorm:
					new FireWormState().Hit();
					break;
			}
		}
	}
	static Dash = function () {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					new DeathState().Dash();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Dash();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Dash();
					break;
			}
		}
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Dash();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Dash();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Dash();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Dash();
					break;
				case Minion.Goblin:
					new GoblinState().Dash();
					break;
				case Minion.Slime:
					new SlimeState().Dash();
					break;
				case Minion.EvilEye:
					new EvilEyeState().Dash();
					break;
				case Minion.Skeleton:
					new SkeletonState().Dash();
					break;
				case Minion.Mushroom:
					new MushroomState().Dash();
					break;
				case Minion.FireWorm:
					new FireWormState().Dash();
					break;
			}
		}
	}
	static Idle	= function () {
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
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Idle();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Idle();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Idle();
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
				case Minion.EvilEye:
					new EvilEyeState().Idle();
					break;
				case Minion.Skeleton:
					new SkeletonState().Idle();
					break;
				case Minion.Mushroom:
					new MushroomState().Idle();
					break;
				case Minion.FireWorm:
					new FireWormState().Idle();
					break;
			}
		}
	}
	static Jump	= function () {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
					new DeathState().Jump();
					break;
				case Boss.DemonSkeleton:
					new DemonSkeletonState().Jump();
					break;
				case Boss.KingSlime:
					new KingSlimeState().Jump();
					break;
			}
		}
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Jump();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Jump();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Jump();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Jump();
					break;
				case Minion.Goblin:
					new GoblinState().Jump();
					break;
				case Minion.Slime:
					new SlimeState().Jump();
					break;
				case Minion.EvilEye:
					new EvilEyeState().Jump();
					break;
				case Minion.Skeleton:
					new SkeletonState().Jump();
					break;
				case Minion.Mushroom:
					new MushroomState().Jump();
					break;
				case Minion.FireWorm:
					new FireWormState().Jump();
					break;
			}
		}
	}
	static Walk	= function () {
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
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Walk();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Walk();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Walk();
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
				case Minion.EvilEye:
					new EvilEyeState().Walk();
					break;
				case Minion.Skeleton:
					new SkeletonState().Walk();
					break;
				case Minion.Mushroom:
					new MushroomState().Walk();
					break;
				case Minion.FireWorm:
					new FireWormState().Walk();
					break;
			}
		}
	}
	static Attack = function () {
		if (_obj.identity == Identity.Boss) {
			switch (_obj.name) {
				case Boss.Death:
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
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Attack();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Attack();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Attack();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
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
				case Minion.EvilEye:
					new EvilEyeState().Attack();
					break;
				case Minion.Skeleton:
					new SkeletonState().Attack();
					break;
				case Minion.Mushroom:
					new MushroomState().Attack();
					break;
				case Minion.FireWorm:
					new FireWormState().Attack();
					break;
			}
		}
	}
	static Cutscene	= function () {
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
		else if (_obj.identity == Identity.SubBoss) {
			switch (_obj.name) {
				case SubBoss.EvilWizard:
					new EvilWizardState().Cutscene();
					break;
				case SubBoss.Nightmare:
					new NightmareState().Cutscene();
					break;
				case SubBoss.Primordial:
					new PrimordialState().Cutscene();
					break;
			}
		}
		else if (_obj.identity == Identity.Minion) {
			switch (_obj.name) {
				case Minion.Hound:
					new HoundState().Cutscene();
					break;
				case Minion.Goblin:
					new GoblinState().Cutscene();
					break;
				case Minion.Slime:
					new SlimeState().Cutscene();
					break;
				case Minion.EvilEye:
					new EvilEyeState().Cutscene();
					break;
				case Minion.Skeleton:
					new SkeletonState().Cutscene();
					break;
				case Minion.Mushroom:
					new MushroomState().Cutscene();
					break;
				case Minion.FireWorm:
					new FireWormState().Cutscene();
					break;
			}
		}
	}
}

function DrawElementEnemy (_obj) constructor {
	life_temp = _obj.status.Life.Atual;
	life_bg   = _obj.status.Life.Atual;
	
	static LifeBar = function () {
		var wLife = (life_temp / _obj.status.Life.Max) * 270;
		var wLifeBackground = (life_bg / _obj.status.Life.Max) * 270;
		
		var colorBar = merge_color(c_red, c_lime, life_temp / _obj.status.Life.Max)
		
		life_temp = lerp(life_temp, clamp(_obj.status.Life.Atual, 0, _obj.status.Life.Max), 0.1);
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
			.Text(string(_obj.status.Life.Atual) + "/" + string(_obj.status.Life.Max), 270 - 40, 8 + 10, 1, 1, ft_status,, true, c_black, fa_center, fa_middle);
	}
}