// Gravity Check
if (place_meeting(x,y+7+yVel,platform_obj)) { // Other conditions here to check for tiles
	if (falling) {
		while (!place_meeting(x,y+7+sign(yVel), platform_obj)) {
			y = y + sign(yVel);
		}
		falling = false;
	}
	yVel = 0;
	jump = false;
}
else {
	yVel = yVel + gravityAccel;
}

// Jumping into a platform check
if (place_meeting(x,y-7+yVel,platform_obj)) {
	while (!place_meeting(x,y-7+sign(yVel), platform_obj)) {
		y = y + sign(yVel);
	}
	yVel = 0;
}

if (yVel > 0) {
	falling = true;
}
y = y + yVel;

if (keyboard_check(vk_right)) {
	if (!place_meeting(x+5+4,y,platform_obj)) { // Collision detection
		x = x + 5;
	}
	else {
		while (!place_meeting(x+sign(5)+4,y, platform_obj)) {
			x = x + sign(5);
		}
	}
	sprite_index = dude_spr_running;
	if (!lookingRight) {
		image_xscale = 1;
		lookingRight = true;
	}
}
if (keyboard_check(vk_left)) {
	
	if (!place_meeting(x-5-4,y,platform_obj)) { // Collision detection
		x = x - 5;
	}
	else {
		while (!place_meeting(x+sign(-5)-4,y, platform_obj)) {
			x = x + sign(-5);
		}
	}
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
if (keyboard_check(vk_up) && !jump) {
	yVel = -20;
	sprite_index = dude_spr_running;
	jump = true;
}
if (!keyboard_check(vk_up) && !keyboard_check(vk_left) && ! keyboard_check(vk_right)) {
	sprite_index = dude_spr_idle;
}

if (y > room_height) {
	room_restart();
}

if ( keyboard_check_released(ord("R")) ) {
	room_restart();
}

if ( keyboard_check_released(ord("S")) ) {
	room_goto(Swamp1);
	
}