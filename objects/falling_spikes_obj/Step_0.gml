/// @description Insert description here
// You can write your code in this editor

if ( (dude_obj.x > x - 32 ) && (dude_obj.x < x + 32) ) {
	falling = true;
	//timeStep++;
}

if (falling == true) {
	y += 40;
}

if (y > room_height) {
	instance_destroy();
}