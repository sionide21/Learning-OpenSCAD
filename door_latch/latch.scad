$fn = 250;

difference() {
  linear_extrude(3.5)
  hull() {
    circle(d=30);

    translate([120, 0, 0])
    circle(d=30);
  }

  // Hinge mount point
  translate([0, 0, 2])
  rotate([0, 180, 0])
  difference() {
    cylinder(20, d=25 - 0.2);

    translate([10, 0, 0])
    cube([5, 5, 41], center=true);

    translate([-10, 0, 0])
    cube([5, 5, 41], center=true);
  }
}


// Handle
translate([120, 0, 0])
union() {
  cylinder(40, d=20);
  translate([0, 0, 40])
  sphere(d=20);
}
