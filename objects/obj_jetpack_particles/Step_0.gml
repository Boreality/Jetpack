 /// @desc

x+=hsp;
y+=vsp;

hsp*=0.9;
vsp*=0.9;


//Collision
//Horizontal Collision
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



