if (keyboard_check(vk_right)) {
	x = x + 5;
	sprite_index = dude_spr_running;
}
else if (keyboard_check(vk_left)) {
	x = x - 5;
	sprite_index = dude_spr_running;
}
else if (keyboard_check(vk_down)) {
	y = y + 5;
	sprite_index = dude_spr_running;
}
else if (keyboard_check(vk_up)) {
	y = y - 5;
	sprite_index = dude_spr_running;
}
else {
	sprite_index = dude_spr_idle;
}