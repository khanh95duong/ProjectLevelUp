// Gravity Check
if (place_meeting(x+5+5,y+10+yVel,platform_obj) && place_meeting(x-5-5,y+10+yVel,platform_obj)) { // Other conditions here to check for tiles
	if (falling) {
		while (!place_meeting(x+5+5,y+10+sign(yVel), platform_obj) && !place_meeting(x-5-5,y+10+sign(yVel), platform_obj)) {
			y = y + sign(yVel);
		}
		falling = false;
		yVel = 0;
		jump = false;
	}
}
else {
	yVel = yVel + gravityAccel;
}

// Jumping into a platform check
if (place_meeting(x+5+5,y-10+yVel,platform_obj) && place_meeting(x-5-5,y-10+yVel,platform_obj)) {	
	while (!place_meeting(x+5+5,y-10+sign(yVel), platform_obj) && !place_meeting(x-5-5,y-10+yVel,platform_obj)) {
		y = y + sign(yVel);
	}
	yVel = 0;
}

if (yVel > 0) {
	falling = true;
}
y = y + yVel;

if (keyboard_check(vk_right)) {
	if (!place_meeting(x+5+5,y,platform_obj)) { // Collision detection
		x = x + 5;
	}
	else {
		while (!place_meeting(x+sign(5)+5,y, platform_obj)) {
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
	
	if (!place_meeting(x-5-5,y,platform_obj)) { // Collision detection
		x = x - 5;
	}
	else {
		while (!place_meeting(x+sign(-5)-5,y, platform_obj)) {
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
	audio_play_sound(jump_snd, 1, false);
	jump = true;
}
if (!keyboard_check(vk_up) && !keyboard_check(vk_left) && ! keyboard_check(vk_right)) {
	sprite_index = dude_spr_idle;
}

if (y > room_height) {
	if (!audio_is_playing(fall_snd)) {
		audio_play_sound(fall_snd, 1, false);
	}
	death_tracker_obj.deaths++;
	room_restart();
}

if ( keyboard_check_released(ord("R")) ) {
	death_tracker_obj.deaths++;
	room_restart();
}

// For debugging each level
if ( keyboard_check_released(ord("1")) ) {
	room_goto(AbnCastle);
}
if ( keyboard_check_released(ord("2")) ) {
	room_goto(Forest1);
}
if ( keyboard_check_released(ord("3")) ) {
	room_goto(Forest2);
}
if ( keyboard_check_released(ord("4")) ) {
	room_goto(Forest3);
}
if ( keyboard_check_released(ord("5")) ) {
	room_goto(Mountain1);
}
if ( keyboard_check_released(ord("6")) ) {
	room_goto(Mountain2);
}
if ( keyboard_check_released(ord("7")) ) {
	room_goto(Mountain3);
}
if ( keyboard_check_released(ord("8")) ) {
	room_goto(Swamp1);
}
if ( keyboard_check_released(ord("9")) ) {
	room_goto(Swamp2);
}
if ( keyboard_check_released(ord("0")) ) {
	room_goto(Swamp3);
}
if ( keyboard_check_released(ord("P")) ) {
	room_goto(endScreen);
}