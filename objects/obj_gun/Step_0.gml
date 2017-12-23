/// @desc

x = obj_player.x;
y = obj_player.y;

image_angle = point_direction(x,y,mouse_x,mouse_y);

#region //Creating Bullest and jetpack physics intertwined

firing_delay -= 1;

if(obj_player.key_fire) && (firing_delay <= 0)
{
	firing_delay = 10;		// Creating Bullets
	
	if (image_angle >= 45) && (image_angle <= 135) obj_player.vsp += 5;
	if (image_angle >= 225) && (image_angle <= 315) obj_player.vsp -= 6;
	
	with(instance_create_layer(x,y,"Bullet",obj_bullet))
	{
		speed = 15;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
	
}

#endregion

//== Bullet Recoi

