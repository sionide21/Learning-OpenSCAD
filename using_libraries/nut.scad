use <threads.scad>;

$fa = 1;
$fs = 0.1;

FILLET = 1;
WALL_THICKNESS = 2;
DEPTH = 11;

translate([0, 0, 2])
difference() {
  rotate_extrude() {
    translate([14.5, 0, 0]) {
      translate([-FILLET, 0, 0])
      difference() {
        square(FILLET);
        translate([0, FILLET, 0])
        circle(r=FILLET);
      }

      difference() {
        square([WALL_THICKNESS, DEPTH + FILLET]);

        translate([0, DEPTH, 0])
        difference() {
          translate([-FILLET, 0, 0])
          square(2*FILLET);
          translate([FILLET, 0, 0])
          circle(r=FILLET);
        }
      }

      translate([WALL_THICKNESS, 0, 0])
      difference() {
        square(FILLET);
        translate([FILLET, FILLET, 0])
        circle(r=FILLET);
      }
    }
  }

  translate([0, 0, FILLET])
  // Necessary or the preview freezes openscad. Render time: 3 minutes, 13 seconds
  render()
  metric_thread(diameter=30, pitch=1, length=DEPTH + 1, internal=true);
}

cylinder(d=60, h=2);
