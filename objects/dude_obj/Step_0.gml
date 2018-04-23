if (keyboard_check(vk_right)) {
	mr = 1;
	sprite_index = dude_spr_running;
	if (!lookingRight) {
		image_xscale = 1;
		lookingRight = true;
	}
}
else {
	mr = 0;
}

if (keyboard_check(vk_left)) {
	ml = -1;
	sprite_index = dude_spr_running;
	if (lookingRight) {
		image_xscale = -1;
		lookingRight = false;
	}
}
else {
	ml = 0;
}

if (keyboard_check(vk_up) && !jump) {
	sprite_index = dude_spr_running;
	audio_play_sound(jump_snd, 1, false);
	yVel = -21;
	jump = true;
}

if (!keyboard_check(vk_up) && !keyboard_check(vk_left) && ! keyboard_check(vk_right)) {
	sprite_index = dude_spr_idle;
}

yVel = yVel + gravityAccel;
xVel = (ml + mr) * movespd;

if (!place_meeting(x+xVel,y, platform_obj)) {
	x += xVel
}
else {
	var m = sign(xVel);
	repeat(abs(ceil(xVel))) {
		if (!place_meeting(x+m,y, platform_obj)) {
			x += m;
		}
		else {
			xVel = 0;
			break;
		}
	}
}

if (!place_meeting(x,y+yVel, platform_obj)) {
	y += yVel;
}
else {
	var m = sign(yVel);
	repeat(abs(ceil(yVel))) {
		if (!place_meeting(x,y+m, platform_obj)) {
			y += m;
		}
		else {
			yVel = 0;
			if (m > 0) {
				jump = false;
			}
			break;
		}
	}
}

// Gravity Check
/*if (place_meeting(x,y+yVel,platform_obj)) { // Other conditions here to check for tiles
	if (falling) {
		while (!place_meeting(x,y+sign(yVel), platform_obj)) {
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
if (place_meeting(x,y+yVel,platform_obj)) {	
	while (!place_meeting(x,y+sign(yVel), platform_obj)) {
		y = y + sign(yVel);
	}
	yVel = 0;
}

if (yVel > 0) {
	falling = true;
}*/

//y = y + yVel;

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