if (x > startX + 100) {
	right = false;
}
else if (x < startX - 100) {
	right = true;
}

if (right) {
	x += 5;
}
else {
	x -= 5;
}