if (abs(dude_obj.x - x) < 50 && abs(dude_obj.y - y) < 100 && !visible) {
	audio_play_sound(unshealth_snd, 1, false);
	visible = true;
}