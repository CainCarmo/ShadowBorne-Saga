#region [Ground Collised Check]

hadGroundCollised = place_meeting(obj_player.x, obj_player.y + 1, obj_block_collisor);

#endregion

#region [Apply Gravity]

Utils(obj_player).ApplyGravity();

#endregion

#region [Movimentation]

obj_player.speed_horizontal = (obj_player.right - obj_player.left) * obj_player.speed_horizontal_max;

#endregion

#region [State Check]

StateMachine(obj_player);

#endregion