
#region//==Input

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);
key_jet = mouse_check_button_pressed(mb_right);
key_sprint = keyboard_check(vk_shift);
key_fire = mouse_check_button(mb_left);

#endregion


//==Movement
#region//Basic movement
var Move = key_right - key_left;

hsp = Move * walksp;

//Gravity
vsp += grv;
#endregion
 
#region//Acceleration/Friction  UNDER CONSTRUCTION
/*
SHOULDNT BE SWITCH
switch (keyboard_key)
{
	case ord("D"):
		acce++;
		break;
	case ord("A"):
		acce--;
	default:
		acce = 0;
}
clamp (acce,-1,1);
*/
#endregion

#region//Double Jump
if(place_meeting(x,y + 1, obj_wall ))
{
	jumps = jumpsmax;
	cy_time = cy_time_max;
}else cy_time--;

if(key_jump) && (jumps > 0)
{
	if(cy_time > 0)
	{
		vsp = -jumpspeed;
	}
	else
	{
		jumps -= 1;
		vsp = -jumpspeed;
	}
	if(!contact) && (cy_time < 0)
	{
		instance_create_layer(x,y,"Bullet",obj_explosion);
	}
}
with(obj_explosion)
{
	if (image_index == 4) instance_destroy();	
}
#endregion

#region//Sprinting

if(key_sprint)	
{
	walksp = 9;
}
else walksp = 6;


#endregion



#region//==Bullet Recoil
//Gun recoil
firing_delay--;
if(key_fire) && (firing_delay <= 0)
{
	if (obj_gun.image_angle >= 225) && (obj_gun.image_angle <= 315) vsp -= 6;
	if (obj_gun.image_angle >= 45) && (obj_gun.image_angle <= 135) vsp += 5;

	if (obj_gun.image_angle >= 135 ) && (obj_gun.image_angle <= 225) hsp += 8;

	if (obj_gun.image_angle >= 315 ) && (obj_gun.image_angle <= 360 )  hsp -= 8;
	if (obj_gun.image_angle >= 0) && (obj_gun.image_angle <= 45)  hsp -= 8; 
	
	firing_delay = 10;
	with(instance_create_layer(x,y,"Bullet",obj_bullet))
	{
		speed = 15;
		direction = obj_gun.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}
#endregion

#region//==Collision

//Horizontal Collision
if(place_meeting(x + hsp,y,obj_wall))
{
	hsp = 0;
}
else 
x += hsp;

//Vertical Collision
if(place_meeting(x,y + vsp,obj_wall))
{
	vsp = 0;
	contact = true;
}
else contact = false;

y += vsp;

#endregion
