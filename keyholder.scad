$fa = 1;
$fs = 0.1;

KEYWAY = [5, 5, 36];
CUTOUT = 4;
WIDTH = 14;
R = 3;
HOLE = 3;

difference() {
  linear_extrude(36)
  hull() {
    translate([CUTOUT*sqrt(2)/2, CUTOUT*sqrt(2)/2])
    rotate([0, 0, 45])
    square(CUTOUT, center=true);

    translate([WIDTH-1, 0])
    square();

    translate([0, WIDTH-1])
    square();

    translate([WIDTH-R, WIDTH-R])
    circle(R);
  }

  translate([2.5, 7, 2])
  translate([KEYWAY.x, 0, KEYWAY.z/2])
  rotate([0, 14, 0])
  translate(-KEYWAY/2)
  rounded_cube(KEYWAY);

  translate([7.5, 0, 4.5])
  hole();

  translate([3.5, 0, 29])
  hole();
}


module hole() {
  translate([HOLE/2, 18, HOLE/2])
  rotate([90, 0, 0])
  union() {
    cylinder(d=HOLE*2, h=6);
    cylinder(d=HOLE, h=20);
  }
}

module rounded_cube(size, r=1) {
  hull() {
    for (x=[r, size.x - r]) {
      for (y=[r, size.y - r]) {
        for (z=[r, size.z - r]) {
          translate([x, y, z])
          sphere(r);
        }
      }
    }
  }
}
