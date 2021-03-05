$fa = 1;
$fs = 0.01;

LENGTH = 80;
WIDTH = 30;
HEIGHT = 5;
INSET = 0.8;


difference() {
  scale([LENGTH, WIDTH])
  cylinder(HEIGHT, d=1);

  translate([0, 0, HEIGHT])
  scale([LENGTH, WIDTH, 2*HEIGHT - 0.2] - 2 * [INSET, INSET, 0])
  sphere(d=1);

  translate([0, 0, -0.1])
  linear_extrude(3)
  text("BURT'S BEES", halign="center", valign="center", size=5);
}
