/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_released(ord("R"))) {
	instance_destroy();
	death_tracker_obj.deaths = 0;
	room_goto(AbnCastle);
}