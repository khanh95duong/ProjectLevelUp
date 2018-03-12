// Gravity Check
if (y >= room_height - 25) { // Other conditions here to check for tiles
	yVel = 0;
	y = room_height - 25;
}
else {
	yVel = yVel + gravityAccel;
}

if (keyboard_check(vk_right)) {
	x = x + 5;
	sprite_index = dude_spr_running;
	if (!lookingRight) {
		image_xscale = 1;
		lookingRight = true;
	}
}
if (keyboard_check(vk_left)) {
	x = x - 5;
	sprite_index = dude_spr_running;
	if (lookingRight) {
		image_xscale = -1;
		lookingRight = false;
	}
}
if (keyboard_check(vk_down)) {
	//y = y + 5;
	//sprite_index = dude_spr_running;
}
if (keyboard_check(vk_up)) {
	yVel = -25;
	sprite_index = dude_spr_running;
}
if (!keyboard_check(vk_up) && !keyboard_check(vk_left) && ! keyboard_check(vk_right)) {
	sprite_index = dude_spr_idle;
}

y = y + yVel;