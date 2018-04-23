var x1 = argument0,
  y1 = argument1,
  text = argument2;
  c1 = c_black;

var c2 = draw_get_colour();

draw_set_color(c1);

draw_text(x1 - 1, y1 - 1, text);
draw_text(x1, y1 - 1, text);
draw_text(x1 + 1, y1 - 1, text);
draw_text(x1 - 1, y1, text);
draw_text(x1 + 1, y1, text);
draw_text(x1 - 1, y1 + 1, text);
draw_text(x1, y1 + 1, text);
draw_text(x1 + 1, y1 + 1, text);

draw_set_color(c2);

draw_text(x1, y1, text);