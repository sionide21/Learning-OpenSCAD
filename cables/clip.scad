$fn = 100;

use <base.scad>;

WIDTH = 18;
DEPTH = 10;
FLANGE = DEPTH - 3;

linear_extrude(20) {
  bracket();

  translate([19 - WIDTH/2, -DEPTH, 0]) {
    square([WIDTH, 2]);

    difference() {
      rotate(90)
      union() {
        square([FLANGE, 2]);

        translate([FLANGE, 1, 0])
        circle(d = 2);
      }

      translate([-2, 0, 0])
      fillet();
    }

    translate([WIDTH + 2, 0, 0])
    rotate(90)
    difference() {
      square([DEPTH, 2]);
      fillet();
    }
  }
}
