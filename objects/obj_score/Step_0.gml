/// @desc


if(score_active)
{
	score_time = score_time / 60;
	score_total = score_time - score_enemy;	
	score_total = clamp(score_total,0,5000)
	score_active = false;
}
