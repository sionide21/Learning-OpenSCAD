$fn = 500;

DIAMETER = 16.5;
WIDTH = 1.75;
THICKNESS = 1;
CURVATURE = 1.5;

rotate_extrude() {
  translate([DIAMETER/2 + THICKNESS/2, 0, 0])
  intersection() {
    square([THICKNESS + 1, WIDTH], center=true);

    translate([-CURVATURE + THICKNESS/2, 0, 0])
    circle(r=CURVATURE);

    translate([CURVATURE - THICKNESS/2, 0, 0])
    circle(r=CURVATURE);
  }
}
