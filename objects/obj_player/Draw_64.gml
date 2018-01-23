/// @desc

draw_set_font(fnt_timer);

draw_text(15,10,"Timer: " + string(obj_start.timer / 60));

draw_text(850,1000,"Ammo:" + string(ammo));

if(score_present)
{	
	draw_set_font(fnt_score)	
	draw_text(850,550,"Time taken: [" + string(obj_score.score_time) + "]Enemy Bonus: [" + string(obj_score.score_enemy ) + "]Total: [" + string(obj_score.score_total) + "]");	
	draw_text(850,600, "Press [ENTER] to proceed to the next level. Or [R] to retry")
}
