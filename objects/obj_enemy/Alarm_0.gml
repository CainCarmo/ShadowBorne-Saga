if (self.state == EntityState.Die && self.state == EntityState.Hit) return;

state = choose(EntityState.Idle, EntityState.Walk);

alarm[0] = irandom_range(120, 140);