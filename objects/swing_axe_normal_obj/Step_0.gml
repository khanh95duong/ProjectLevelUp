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