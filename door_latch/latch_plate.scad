use <base_plate.scad>;

difference() {
  base_plate();

  translate([60/2, 70/2, -5])
  cylinder(10, d=25, $fn=500);
}
