$fn=100;

/* hole = 4;

module fillet(r) {
   offset(r = -r) {
     offset(delta = r) {
       children();
     }
   }
}

fillet(1)
  cube(size=5); */

  /* linear_extrude(height = 60, twist = 0, slices = 60) { */
   /* difference() { */
   /* size = 10;
     #offset(r = size) {
       offset(delta=-size) {
         difference() {
           square(50, center = true);
           square(40, center = true);
           circle();
         }
       }
     } */
     /* offset(r = 8) {
     } */
   /* } */
 /* } */
 difference() {

 union() {

 cylinder(d=70,h=1.5);

 cylinder(d=57,h=6);

 }

 translate([0,0,-1]) cylinder(d=51,h=8);

 }



/* intersection() {
  translate([2.5, 2.5, 2.5])
  sphere(d=7);

  difference() {
    linear_extrude(5)
    difference() {
      square([5, 5]);
      translate([2.5, 2.5])
      circle(d=hole);
    };

    translate([0, 5])
    rotate([90])
    translate([2.5, 2.5])
    cylinder(d=hole, h=5);

    translate([0, 0, 5])
    rotate([0, 90])
    translate([2.5, 2.5])
    cylinder(d=hole, h=5);
  }
} */
