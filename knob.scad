// Total rendering time: 0 hours, 14 minutes, 13 seconds
$fn = 500;

difference() {
  rotate_extrude() {
    difference() {
      union() {
        difference() {
          square([40, 20]);
        }
        translate([40, 10])
        circle(d=20);
      }
      translate([0, 160 + 15])
      circle(d=320, $fn=500);
      square([5, 20]);
    }
  }

  cut_size = 16;
  for (grip = [0:1:6]) {
    rotate([0, 0, 360 * grip / 6 ])
    translate([39 + cut_size, 0, -.5])
    cylinder(h=21, r=cut_size);
  }

}
