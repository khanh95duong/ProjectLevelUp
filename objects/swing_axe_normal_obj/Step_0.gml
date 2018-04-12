if (moveLeft == true) {
	
	// Only activate if the player is in range
	if ((dude_obj.y >= y - 64) && (dude_obj.y <= y + 64)) {
		if (dude_obj.x < x) {
			continueMoving = true;
		}
	}
	// Size of the sprite
	if (x <= -sprite_width) {
		instance_destroy();
	}
	
	if (continueMoving) {
		x -= 5;
	}
}

else if (moveRight == true) {
	
	if ((dude_obj.y >= y - 64) && (dude_obj.y <= y + 64)) {
		if (dude_obj.x > x) {
			continueMoving = true;
		}
	}
	if (x >= room_width + sprite_width) {
		instance_destroy();
	}
	if (continueMoving) {
		x += 5;
	}
}

else {

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
}