/// @description Insert description here
// You can write your code in this editor

if ( (dude_obj.x > x - 32 ) && (dude_obj.x < x + 32) ) {
	falling = true;
	timeStep++;
}

if (falling == true) {
	y += 0.5 * timeStep * 9.81;
}

if (y > room_height) {
	instance_destroy();
}