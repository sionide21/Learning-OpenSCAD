use <threads.scad>;

$fa = 1;
$fs = 0.1;

FILLET = 1;
// Clearance for the screw to fit
SHRINK = .3;

translate([0, 0, 2])
union() {
  translate([0, 0, FILLET])
  difference() {
    // Necessary or the preview freezes openscad. Render time: 2 minutes, 35 seconds
    render()
    metric_thread(diameter=30 - SHRINK, pitch=1, length=10);

    translate([0, 0, 10 - FILLET])
    rotate_extrude()
    translate([15 - FILLET - SHRINK, 0, 0])
    difference() {
      square(2*FILLET);
      circle(r=FILLET);
    }
  }

  rotate_extrude() {
    difference() {
      square([15 + FILLET - SHRINK, FILLET]);

      translate([15 + FILLET - SHRINK, FILLET, 0])
      circle(r=FILLET);
    }
  }
}
cylinder(d=60, h=2);
