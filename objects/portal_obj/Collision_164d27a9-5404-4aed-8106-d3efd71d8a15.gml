if (room_exists(room_next(room))) {
	audio_play_sound(lvlup_snd, 1, false);
	room_goto_next();
}
