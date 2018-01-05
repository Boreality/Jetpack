/// @desc
draw_self();

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);


draw_text(cx+cw/2,cy+20,"Version:" + string(version));
draw_text(cx+cw/2,cy+50,"Timer: " + string(obj_start.timer));
draw_text(cx+cw/2,cy+70,"Coyote time:" + string(cy_time));
draw_text(cx+cw/2,cy+90,"Effect Duration:" + string(obj_status.duration));