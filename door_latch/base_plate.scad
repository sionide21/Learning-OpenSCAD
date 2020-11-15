module base_plate() {
  linear_extrude(1) {
    difference() {
      minkowski($fn = 100) {
        circle(3);

        translate([3, 3, 0])
        square([60 - 6, 70 - 6]);
      }

      translate([10, 10])
      square([1.5, 5]);

      translate([60 - 10 - 1.5, 10])
      square([1.5, 5]);

      translate([10, 70 - 10 - 5])
      square([1.5, 5]);

      translate([60 - 10 - 1.5, 70 - 10 - 5])
      square([1.5, 5]);
    }
  }
}
