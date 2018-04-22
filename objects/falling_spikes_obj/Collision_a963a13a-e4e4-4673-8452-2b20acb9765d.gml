/// @description Insert description here
// You can write your code in this editor

instance_destroy(other);
audio_play_sound(stab_snd, 1, false);
death_tracker_obj.deaths++;
room_restart();