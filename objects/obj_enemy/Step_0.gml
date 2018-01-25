/// @desc
if(!alive)
{
	
	respawn_timer--;
	while(respawn_timer <= 0)
	{
		alive = true;
		respawn_timer = respawn_timer_always;
	}

}