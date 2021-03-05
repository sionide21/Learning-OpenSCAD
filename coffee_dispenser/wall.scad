$fa = 1;
$fs = 0.1;

OPENING_ANGLE = 45;
HEIGHT = 100;
GRIP_SIZE = 15;
THICKNESS = 3;
CARDBOARD_THICKNESS = 3;

wall();

module wall() {
  difference() {
    translate([0, 0, -THICKNESS/2])
    linear_extrude(THICKNESS)
    side();

    each_edge() {
      knockout();
    }
  }

  each_edge() {
    grip();
  }
}

module side() {
  difference() {
    hull() {
      square([HEIGHT, 0.01]);

      rotate(OPENING_ANGLE)
      square([HEIGHT, 0.01]);
    }

    circle(r=HEIGHT/5);
  }
}

module grip() {
  translate([0, 0, THICKNESS/2])
  union() {
    cube([HEIGHT, 1, GRIP_SIZE]);

    translate([0, CARDBOARD_THICKNESS+1, 0])
    cube([HEIGHT, 1, GRIP_SIZE]);
  }
}

module knockout() {
  translate([0, 1, 0])
  cube([HEIGHT, CARDBOARD_THICKNESS, THICKNESS/2 + 0.01]);
}

module bound() {
  intersection() {
    children();

    translate([0, 0, -50])
    linear_extrude(100)
    side();
  }
}

module each_edge() {
  bound() {
    children();
  }

  bound() {
    rotate(45)
    rotate([180, 0, 0])
    children();
  }
}
/*
function top_len() = sqrt(2*HEIGHT*HEIGHT - 2*HEIGHT*HEIGHT*cos(OPENING_ANGLE));

function top_angle() = asin(HEIGHT * sin(OPENING_ANGLE) / top_len()); */
