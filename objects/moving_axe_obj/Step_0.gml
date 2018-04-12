if (forward) {
	image_angle += 5;
}
else {
	image_angle -= 5;
}

if (image_angle > start_angle + 90) {
	forward = false;
}
else if (image_angle < start_angle - 90) {
	forward = true;
}

if (right) {
	x = x + 10;
}
else {
	x = x - 10;
}

if (x > window_get_width() + 20 && right) {
	right = false;
	image_angle = 180 + start_angle;
	start_angle = image_angle;
}
else if (x < 20 && !right) {
	right = true;
	image_angle = start_angle - 180;
	start_angle = image_angle;
}