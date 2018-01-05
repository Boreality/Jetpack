/// @desc
if(place_meeting(x,y,obj_player))
{
	with(obj_status)
	{
		duration = room_speed * 3;	
		buff_type = "speed"
	}
	instance_destroy();
}
