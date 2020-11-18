$fn = 100;

use <base.scad>;

DEPTH = 20;
GAP = 3;
FLANGE = 12;
WIDTH = 70;

linear_extrude(20) {
  translate([WIDTH / 2 - 17, 0, 0])
  bracket();

  translate([0, -DEPTH - 2]) {

    difference() {
      square([2, DEPTH - GAP]);
      fillet();

      translate([0, DEPTH - GAP, 0])
      rotate(270)
      fillet();
    }

    translate([2, DEPTH - GAP - 2, 0])
    union() {
      square([FLANGE, 2]);

      translate([FLANGE, 1, 0])
      circle(d = 2);
    }

    translate([2, 0, 0])
    square([WIDTH, 2]);

    translate([WIDTH + 2, 0, 0]) {
      difference() {
        square([2, DEPTH - GAP]);

        translate([2, 0, 0])
        rotate(90)
        fillet();

        translate([2, DEPTH - GAP, 0])
        rotate(180)
        fillet();
      }

      translate([-FLANGE, DEPTH - GAP - 2, 0])
      union() {
        square([FLANGE, 2]);

        translate([0, 1, 0])
        circle(d = 2);
      }
    }
  }
}

translate([WIDTH / 2 + 2, 0, 10])
rotate([90, 0, 0])
cylinder(d = 10, h = DEPTH);
