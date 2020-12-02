$fa = 1;
$fs = 0.1;


DEPTH = 8;
BRICK_HEIGHT = 58;
GAP = 8;

linear_extrude(3)
mount();


module mount() {
  pin();

  translate([8, 0])
  bar();

  translate([0, BRICK_HEIGHT + GAP])
  mirror([0, 1, 0])
  pin();

  translate([22, -50])
  mirror([1, 0, 0])
  hook();
}

module hook() {
  difference() {
    circle(14);
    circle(10);

    translate([-6, 0])
    square(20);
  }

  translate([-6, 10])
  circle(3);

  translate([10, 0])
  bar();
}

module bar() {
  hull() {
    translate([2, 0])
    circle(2);

    translate([2, BRICK_HEIGHT + GAP])
    circle(2);
  }
}

module pin() {
  barb();

  hull() {
    translate([2, 0])
    square(4, center=true);

    translate([10, 0])
    circle(2);
  }
}

module barb() {
  translate([.5, 1.5])
  fin();

  translate([2, 1.5])
  fin();

  translate([3.5, 1.5])
  fin();
}

module fin() {
  hull() {
    circle(.5);
    translate([3, 3])
    circle(.25);
  }
}
