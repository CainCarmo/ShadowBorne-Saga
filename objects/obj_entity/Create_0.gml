#region Status

life_max   = 1;
life_atual = life_max;

speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 1;
speed_vertical_max   = 1;

bulk = 1;

#endregion

#region Information

brood = undefined;
state = undefined;
type  = undefined;
class = undefined;


#endregion

#region Movimentation

left  = false; 
right = false;
jump  = false;

attack = false;
groundCollided = false;

#endregion

#region Combat

damage = 1;

comboState = false;
comboIndex = undefined;

#endregion

#region Model

scale_x = 1;

#endregion

#region Debug

view_state = true;

#endregion