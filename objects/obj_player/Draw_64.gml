/// @desc
var cx = camera_get_view_x(obj_camera.cam);
var cy = camera_get_view_y(obj_camera.cam);
var cw = camera_get_view_width(obj_camera.cam);
var ch = camera_get_view_height(obj_camera.cam)

draw_set_font(fnt_timer);

draw_text(15,10,"Timer: " + string(obj_start.timer / 60));

draw_text(15,50,"Ammo:" + string(ammo));

if(score_present) && (room != End)
{	
	draw_set_font(fnt_score)	
	draw_text(650,550,"Time taken: [" + string(obj_score.score_time) + "]Enemy Bonus: [" + string(obj_score.score_enemy ) + "]Total: [" + string(obj_score.score_total) + "]");		
	draw_text(650,600, "Press [ENTER] to proceed to the next level. Or [R] to retry")
}

