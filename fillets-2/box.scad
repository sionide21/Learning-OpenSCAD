$fn = 100;

box(dimensions=[20, 50, 9], walls=[2, 2, 2], fillet=1.5, inset=[1, 1, 1]);

translate([-30, 0, 0]) lid(dimensions=[20, 50, 1], fillet=1.5, inset=[1, 1, 1]);

module lid(dimensions, fillet, inset) {
  cube(dimensions);

  translate([inset[0], inset[1], dimensions[2]])
  linear_extrude(height=inset[2])
  translate([fillet, fillet, 0])
  minkowski() {
    circle(r=fillet);
    square(dimensions - 2*inset - 2*[fillet, fillet]);
  }
};


module box(dimensions, walls, fillet, inset) {
  difference() {
    cube(dimensions);

    translate(walls + [fillet, fillet, fillet])
    minkowski() {
      sphere(r=fillet);
      cube(dimensions - 2*walls - 2*[fillet, fillet, -1]);
    }

    translate([inset[0], inset[1], dimensions[2] - inset[2]])
    linear_extrude(height=2*inset[2])
    translate([fillet, fillet, 0])
    minkowski() {
      circle(r=fillet);
      square(dimensions - 2*inset - 2*[fillet, fillet]);
    }
  }
};
