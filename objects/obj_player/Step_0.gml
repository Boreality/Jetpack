 #region//=Input

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);
key_jet = mouse_check_button_pressed(mb_right);
key_sprint = keyboard_check(vk_shift);
key_fire = mouse_check_button(mb_left);

#endregion


//==Movement
#region//=Basic movement
var Move = key_right - key_left;

hsp = Move * walksp + fire_recoil;

//hsp = clamp(hsp,-15,20)
//Gravity
vsp += grv;
#endregion

#region//==Double Jump

if(place_meeting(x,y + 1, obj_wall ))
{
	jumps = jumpsmax;
	cy_time = cy_time_max;
}else cy_time--;

if(key_jump) && (jumps > 0)
{
	if(cy_time > 0)	//Coyote Time
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
		vsp -= 1;
		instance_create_layer(x,y,"Bullet",obj_explosion);
		audio_play_sound(snd_jetpack,4,0);
	
		instance_create_layer(x,y,"Bullet",obj_jetpack_particles);
		instance_create_layer(x,y,"Bullet",obj_jetpack_particles);
		instance_create_layer(x,y,"Bullet",obj_jetpack_particles);
		instance_create_layer(x,y,"Bullet",obj_jetpack_particles);
	}
}
with(obj_explosion)
{
	if (image_index == 4) instance_destroy();	
}

#endregion

#region//=Sprinting

if(key_sprint)	
{
	walksp = 9;
}
else walksp = 6;


#endregion



#region//===Bullet Recoil
//Gun recoil
firing_delay--;
if(ammo > 0) && (key_fire)
{
	if(firing_delay <= 0)
	{
		ammo--;
		ScreenShake(10,10);
		if (obj_gun.image_angle >= 225) && (obj_gun.image_angle <= 315)
		{
			if(contact)
			{
				vsp -= contact_fire;
			}else vsp -= no_contact_fire;
		}
		if (obj_gun.image_angle >= 45) && (obj_gun.image_angle <= 135) 
		{
			if(contact)
			{
				vsp += contact_fire;
			}else vsp += no_contact_fire;
		}
		if (obj_gun.image_angle >= 135 ) && (obj_gun.image_angle <= 225)
		{
			if(contact)
			{
				fire_recoil += contact_fire;
			}else fire_recoil += no_contact_fire;
		}

		if (obj_gun.image_angle >= 315 ) && (obj_gun.image_angle <= 360 )  
		{
			if(contact)
			{
				fire_recoil -= contact_fire;
			}else fire_recoil -= no_contact_fire;
		}
		if (obj_gun.image_angle >= 0) && (obj_gun.image_angle <= 45) 
		{
			if(contact)
			{
				fire_recoil -= contact_fire;
			}else fire_recoil -= no_contact_fire;
		}
	
		firing_delay = 10;
		audio_play_sound(snd_gun_firing,3,0);
		with(instance_create_layer(x,y,"Bullet",obj_bullet))
		{
			speed = 25;
			direction = obj_gun.image_angle + random_range(-3,3);
			image_angle = direction;
		}
	}
	}


if(fire_recoil != 0)
{
	fire_recoil_delay--;
	if(fire_recoil_delay == 0)
	{
		fire_recoil = 0;	
		fire_recoil_delay = 10;
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


#region//==Animation

if (hsp != 0)	//Allowing while moving different angles and animation speed
{
	image_xscale = sign(hsp); 
	image_speed = 2;
}else			//Stopping movement and placing sprite to standing frame when still
{
	image_speed = 0;
	image_index = 0;
}

if(!contact)	//Air animation
{
	sprite_index = spr_player_air;
	if(vsp < 0)
	{
		image_index = 0;
	}
	if(vsp > 0)
	{
		image_index = 1;	
	}
}
else sprite_index = spr_player;

with(obj_gun)		//Changing Gun angle based
{
	if(image_angle >= 90) && (image_angle <= 230) image_yscale = -1; else image_yscale = 1;
	
}

if(sprite_index == spr_player)
{
	if(image_index == 0)	
	{
		
	}
}


#endregion

#region==//Timer
if(place_meeting(x,y,obj_finish))
	{	
		if(room == End)
		{
			game_end();	
		}
		with(obj_score)		//All score
		{
			if(score_check)
			{
				score_time += obj_start.timer;
				score_active = true;	//Triggers obj score calculations
				score_check = false;	//To make it happen once
				other.score_present = true
				ScreenShake(10,4)
			}
		}
		obj_start.trigger = false;	
		obj_start.done = true;
	} 
#endregion

