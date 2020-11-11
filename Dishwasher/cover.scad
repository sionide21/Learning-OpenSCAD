THICKNESS = .01;
BOTTOM_DIVOT = 3;

linear_extrude(85) {
  translate([0, -4, 0])
  rotate([0, 0, 85])
  square([1, 5]);

  translate([-5, -3, 0])
  square([1, 3]);

  translate([-118, 45, 0])
  rotate([0, 0, 270])
  square([1, 3]);

  minkowski() {
    union() {
      translate([-THICKNESS, -3, 0])
      square([THICKNESS, 57]);

      translate([-THICKNESS/2, 54, 0])
      rotate([0, 0, 85])
      square([THICKNESS, 78]);

      translate([0, 54, 0])
      translate([-78 * sin(85), 78 * cos(85), 0])
      union() {
        translate([11, -4 , 0])
        square([THICKNESS, 2]);

        translate([11 + 20, -5.5 , 0])
        square([THICKNESS, 2]);

        rotate([0, 0, 85 + 22])
        square([THICKNESS, 42]);
      }

      translate([-118, 48 - BOTTOM_DIVOT, 0])
      square([THICKNESS, BOTTOM_DIVOT]);
    }
    circle(r=1);
  }
}
