/// @desc
draw_self();
draw_set_font(fnt_timer);


var cx = camera_get_view_x(obj_camera.cam);
var cy = camera_get_view_y(obj_camera.cam);
var cw = camera_get_view_width(obj_camera.cam);


//draw_text(cx+cw/2,cy+20,"Version:" + string(version));

//draw_text(cx+cw/2,cy+70,"Coyote time:" + string(cy_time));
//draw_text(cx+cw/2,cy+90,"Effect Duration:" + string(obj_status.duration));
//draw_text(cx+cw/2,cy+110,"Buff Effect: " + string(obj_status.buff_strong));
draw_text(cx+cw/2,cy+1140,"Ammo:" + string(ammo));


draw_text(cx + 10,cy + 10,"Timer: " + string(obj_start.timer / 60));

if(score_present)
{	
	draw_set_font(fnt_score)	
	draw_text(cx+cw/2 - 200,cy + 200,"Time taken: [" + string(obj_score.score_time) + "]Enemy Bonus: [" + string(obj_score.score_enemy ) + "]Total: [" + string(obj_score.score_total) + "]");	
	draw_text(cx+cw/2 - 200,cy + 300, "Press [ENTER] to proceed to the next level. Or [R] to retry")
}
