if (self.state == EntityState.Die) return;

state = choose(EntityState.Idle, EntityState.Walk);

speed_horizontal = speed_horizontal_max * irandom_range(-1, 1);

alarm[0] = irandom_range(120, 140);