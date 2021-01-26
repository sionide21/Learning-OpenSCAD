$fn = 25;

// Width of the arms
WIDTH = 10;

// Height of the arms
HEIGHT = 10;

// Length of each arm
LENGTH = 20;

// Rounding radius for all corners
RADIUS = 1.5;



arm();

translate([WIDTH, 0, 0])
rotate([0, 0, 90])
arm();


module arm() {
  rounded_cube([LENGTH + WIDTH, WIDTH, HEIGHT], r=RADIUS);
}

module rounded_cube(dim, r) {
  hull() {
    for(x=[r, dim[0]-r]) {
      for(y=[r, dim[1]-r]) {
        for(z=[r, dim[2]-r]) {
          translate([x, y, z])
          sphere(r);
        }
      }
    }
  }
}
