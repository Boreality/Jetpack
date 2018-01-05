if(buff_type = "speed") && (duration >= 0) 
{
	duration--;
	with(obj_player)
	{
		walksp = walksp * 2;	//Possible bug
	}
}


if(duration < 0)
{
	buff_type = "inactive"	
	duration = 0;
}


