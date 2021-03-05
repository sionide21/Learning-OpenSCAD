$fa = 1;
$fs = 0.1;

ANGLE = 30;
SHIFT = 25 * [sin(ANGLE), cos(ANGLE)];
THICKNESS = 2;
DEPTH = 15;
BOTTOM_DIAMETER = 25;
WIDTH = 20;
FUDGE_FACTOR = 1;
BACK = false;

difference() {
  hook();

  translate([23, -BOTTOM_DIAMETER/4, WIDTH/2])
  screwway();
}

module screwway() {
  rotate([0, -90, 0]) {
    cylinder(d=4, h=30);
    cylinder(d=7.5, h=10);
  }
}

module hook() {
  linear_extrude(WIDTH)
  union() {
    difference() {
      union() {
        translate([-THICKNESS, 0])
        square([THICKNESS, 40]);

        hull() {
          translate([DEPTH, 0])
          arm();

          translate([-THICKNESS, 0])
          intersection() {
            bottom();

            rotate(-ANGLE)
            translate([15 - THICKNESS/2, -10])
            square(50);
          }
        }

        translate([-THICKNESS, 0])
        bottom();

        translate([-THICKNESS, -BOTTOM_DIAMETER/2])
        square(BOTTOM_DIAMETER/2);
      }

      translate([0, .5])
      square([7, 2]);

      if (!BACK) {
        translate([-50, -50])
        square([50, 100]);
      }
    }

    // Give a litte extra room for staples, folded canvas, etc
    translate([-FUDGE_FACTOR, -BOTTOM_DIAMETER/2])
    square([FUDGE_FACTOR, BOTTOM_DIAMETER/2 + 0.5]);
  }
}


module arm() {
  hull() {
    translate(SHIFT)
    circle(d=THICKNESS);

    translate([THICKNESS/2, THICKNESS/2])
    circle(d=THICKNESS);
  }
}

module bottom() {
  difference() {
    translate([BOTTOM_DIAMETER/2 ,0, 0])
    circle(d=BOTTOM_DIAMETER);
    square(BOTTOM_DIAMETER);
  }
  square([BOTTOM_DIAMETER, THICKNESS]);
}
/* translate([(2*THICKNESS + DEPTH)/2 - THICKNESS, 0, 0]) */






//
