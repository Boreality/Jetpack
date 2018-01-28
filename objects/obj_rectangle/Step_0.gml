/// @desc
if(instance_exists(obj_player))
{
	if(obj_player.score_present)
	{
		visible = true;	
		x = obj_camera.x;
		y = obj_camera.y + 60;
	}
}