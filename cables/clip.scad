$fn = 100;

use <base.scad>;

WIDTH = 18;
WALL_THICKNESS = 1;
RUN_SIZE = 10;
GAP = 3;
DEPTH = RUN_SIZE + WALL_THICKNESS * 2;
FLANGE = RUN_SIZE - GAP;

linear_extrude(20) {
  bracket();

  translate([19 - WIDTH/2, -DEPTH, 0]) {
    square([WIDTH, WALL_THICKNESS]);

    difference() {
      rotate(90)
      union() {
        square([FLANGE, WALL_THICKNESS]);

        translate([FLANGE, WALL_THICKNESS / 2, 0])
        circle(d = WALL_THICKNESS);
      }

      translate([-WALL_THICKNESS, 0, 0])
      fillet(thickness = WALL_THICKNESS);
    }

    translate([WIDTH + WALL_THICKNESS, 0, 0])
    rotate(90)
    difference() {
      square([DEPTH, WALL_THICKNESS]);
      fillet(thickness = WALL_THICKNESS);
    }
  }
}
