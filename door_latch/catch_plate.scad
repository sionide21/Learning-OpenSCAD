use <base_plate.scad>;

base_plate();


difference() {
  translate([0, 15, 1])
  rotate([270, 270, 0])
  linear_extrude(40) {
    square([5, 2]);

    translate([5, 0, 0]) {
      square([2, 30]);

      translate([0, 30, 0])
      rotate(-10)
      square([2, 30]);
    }
  }

  // Round the corners
  rotate([0, -10, 0])
  translate([60 - 3 * sin(-10) - 6, 15, 0])
  difference() {
    translate([3, -0.1, 0])
    cube([3.1, 40.2, 20]);

    hull() {
      translate([3, 3, 0])
      cylinder(20, r=3, $fn=100, center=false);

      translate([3, 40 - 3, 0])
      cylinder(20, r=3, $fn=100, center=false);
    }
  }
}
