$fn = 100;

HEIGHT = 7;
CLEARANCE = 3;
OUTER_DIAMETER = 22;
INNER_DIAMETER = 8;
BEARING_DIAMETER = 5;

inner_radius = INNER_DIAMETER / 2;
outer_radius = OUTER_DIAMETER / 2;
raceway_size = outer_radius - inner_radius - CLEARANCE;
bearing_center = (inner_radius + outer_radius) / 2;

rotate_extrude() {
  difference() {
    union() {
      translate([outer_radius - raceway_size / 2, -HEIGHT / 2, 0])
      square([raceway_size / 2, HEIGHT]);

      translate([inner_radius, -HEIGHT / 2, 0])
      square([raceway_size / 2, HEIGHT]);
    }

    translate([bearing_center, 0, 0])
    circle(BEARING_DIAMETER/2 + .1);
  }
}

bearing_count = floor(360 / asin((BEARING_DIAMETER + .1) / bearing_center));

for (ball_position = [0:1:bearing_count]) {
  rotate([0, 0, 360 * ball_position / bearing_count ])
  translate([bearing_center, 0, 0])
  sphere(d=BEARING_DIAMETER);
}
