$fa = 1;
$fs = 0.1;

SIZE = 50;
HEIGHT = 16;

linear_extrude(HEIGHT)
difference() {
  square(SIZE);

  rotate(45)
  square(SIZE/sqrt(.5));
}
