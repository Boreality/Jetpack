/// @desc

x = obj_player.x;
y = obj_player.y;

image_angle = point_direction(x,y,mouse_x,mouse_y);

#region //Creating Bullest and jetpack physics intertwined
firing_delay -= 1;
if(mouse_check_button(mb_left)) && (firing_delay <= 0)
{
	firing_delay = 5;		// Creating Bullets
	with(instance_create_layer(x,y,"Bullet",obj_bullet))
	{
		speed = 15;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
	
/*	with(obj_player)	//Effects on player for Jetpack
	{
		speed = 15;
		direction = point_direction(x,y,mouse_x,mouse_y) + random_range(-3,3);

		 
	}	*/
}

#endregion