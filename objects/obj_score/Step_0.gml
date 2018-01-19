/// @desc


if(score_active)
{
	score_time = score_time / 60;
	score_total = score_time - score_enemy;	
	
	obj_player.score_present = true
	//show_message("Time taken: " + string(score_time) + "	Enemy Bonus: " + string(score_enemy) + "	Total: " + string(score_total));
	score_active = false;
}
