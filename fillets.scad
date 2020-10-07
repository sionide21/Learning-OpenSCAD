$fn = 100;



difference() {
  cube([30, 50, 20]);
  translate([2, 2, 2]) cube([26, 46, 20]);
}


translate([2, 2, 2])
fillet(r=2, height=18);

translate([28, 2, 2])
rotate([0, 0, 90])
fillet(r=2, height=18);

translate([28, 48, 2])
rotate([0, 0, 180])
fillet(r=2, height=18);

translate([2, 48, 2])
rotate([0, 0, 270])
fillet(r=2, height=18);

translate([2, 2, 2])
rotate([0, 90, 0])
rotate([0, 0, 90])
fillet(r=2, height=26);

translate([2, 48, 2])
rotate([0, 90, 0])
rotate([0, 0, 180])
fillet(r=2, height=26);

translate([2, 2, 2])
rotate([270, 90, 0])
rotate([0, 0, 180])
fillet(r=2, height=46);

translate([28, 2, 2])
rotate([270, 90, 0])
rotate([0, 0, 90])
fillet(r=2, height=46);


module fillet(r, height) {
  linear_extrude(height=height) {
    translate([r/2, r/2, 0])
    difference() {
      square(r, center=true);
      translate([r/2, r/2, 0]) circle(r);
    }
  }
  ;
}
