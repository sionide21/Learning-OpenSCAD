$fn = 250;

difference() {
  cylinder(12, d=25 - 0.2);

  translate([10, 0, 0])
  cube([5, 5, 41], center=true);

  translate([-10, 0, 0])
  cube([5, 5, 41], center=true);
}
