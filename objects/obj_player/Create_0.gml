/// @desc

hsp = 0;
vsp = 0;
grv = 0.8;
walksp = 10;
acce = 0;

contact = false;

//Timers
temp_explosion = 0;
explosion_timer = 15;
footstep_timer = 0;

cy_time = 6;
cy_time_max = 6;

//Bullets
firing_delay = 15;
contact_fire = 5;
no_contact_fire = 10;
ammo = 0;

//Bullets Recoil
fire_recoil = 0;
fire_recoil_delay = 6;

//Jumping
jumps = 0;
jumpsmax = 1;		//Amount of jumps allowed. Number is -1 (ex. 1 = 2 jumps)
jumpspeed = 17;

//Technical
version = 1.00;
score_present = false;

if(room == End)
{
	audio_play_sound(snd_ending,2,false);	
}