/// @desc

if(trigger) && (done = false)
{
	timer++;	
}

with(obj_player) 
{
	if(place_meeting(x,y,obj_finish))
	{
		other.trigger = false;	
		other.done = true;
	}
}

if(done)
{
	//show_message(timer);
	done = false;
}

