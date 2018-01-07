if(buff_type = "speed") && (duration >= 0) 
{
	duration--;
	buff_strong -= 0.001;
	with(obj_player)
	{
		walksp = walksp * other.buff_strong;	
	}
	
}
buff_strong = clamp(buff_strong,1,2);

if(duration < 0)
{
	buff_type = "inactive"	
	duration = 0;
	buff_strong = 2;
}


