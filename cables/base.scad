// Height: 34
$fn = 100;
TIGHTNESS = .05;

linear_extrude(20)
bracket();

module bracket() {
  translate([TIGHTNESS, 0, 0])
  difference() {
    square([2, 22]);
    fillet();

    translate([0, 22, 0])
    rotate(270)
    fillet();
  }

  translate([2 + TIGHTNESS, 0, 0])
  square([34 - 2 * TIGHTNESS, 2]);

  translate([36 - TIGHTNESS, 0, 0])
  rotate(1)
  difference() {
    square([2, 40]);

    translate([2, 0, 0])
    rotate(90)
    fillet();

    translate([2, 40, 0])
    rotate(180)
    fillet();
  }
}

module fillet() {
  difference() {
    square(4, center=true);

    translate([2, 2, 0])
    circle(2);
  }
}
