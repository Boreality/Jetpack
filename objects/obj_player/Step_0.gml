
#region//==Input

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);
key_jet = mouse_check_button_pressed(mb_right);
key_sprint = keyboard_check(vk_shift);
key_fire = mouse_check_button(mb_left);

#endregion

#region//==Movement
var Move = key_right - key_left;

hsp = Move * walksp;

vsp += grv;

//Double Jump

if(place_meeting(x,y + 1, obj_wall ))
{
	jumps = jumpsmax;
}

if(key_jump) && (jumps > 0) 
{
	jumps -= 1;
	vsp = -jumpspeed;
	if(!contact)
	{
		temp_explosion = instance_create_layer(x,y,"Bullet",obj_explosion);
	}
}
with(temp_explosion)s
{
	if (image_index == 4)
	{
		instance_destroy();	
	}
}

if(key_sprint)	//Sprinting
{
	walksp = 9;
}
else walksp = 6;

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





	

	
	
	
	
	
	