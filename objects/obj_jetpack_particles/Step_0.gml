 /// @desc
 
image_speed = 0;
hsp = direction_moving * movement_speed;
hsp = clamp(hsp,-15,20)

//Gravity
vsp += grv;

//Collision
if(place_meeting(x,y,obj_wall))
{
	hsp = 0;
}
x += hsp;

//Vertical Collision
if(place_meeting(x,y,obj_wall))
{
	vsp = 0;

}
y += vsp;

//Lifespan

lifeSpan--;
if(lifeSpan <= 0)
{
	instance_destroy();	
}


