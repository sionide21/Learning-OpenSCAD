$fa = 1;
$fs = 0.01;

LINE_WIDTH = 3;
TOP = 26 + 2*LINE_WIDTH;
REAR = 10;
ROD_DIAM = 12;

linear_extrude(25) {
  rounded_clip();

  translate([TOP - LINE_WIDTH, -21])
  holder();
}


module holder() {
  translate([9, 9])
  difference() {
    square([18, 18], center=true);

    translate([9, -9])
    fillet();

    hull() {
      translate_y(20)
      square(ROD_DIAM, center=true);
      circle(d=ROD_DIAM);
    }

    translate([9, 9])
    fillet();
  }
}

module rounded_clip() {
  difference() {
    square_clip();

    translate_y(LINE_WIDTH) {
      fillet();

      translate_x(TOP)
      fillet();
    }

    translate([TOP, -24 - LINE_WIDTH])
    fillet();

    translate([19 + LINE_WIDTH, -5])
    fillet();

    translate_y(-REAR)
    fillet();
  }
}

module square_clip() {
  line(TOP);

  rotate(-90)
  line(REAR);

  translate_x(26 + LINE_WIDTH) {
    rotate(-90)
    line(24);

    translate([-7, -5])
    square([7, 5]);

    translate([-5.6, -24 - LINE_WIDTH])
    line(5.6 + LINE_WIDTH);
  }
}

module fillet() {
  difference() {
    square(2*LINE_WIDTH, center=true);
    for(r=[0:3]) {
      rotate(90 * r)
      translate([LINE_WIDTH, LINE_WIDTH])
      circle(LINE_WIDTH);
    }
  }
}

module line(x) {
  square([x, LINE_WIDTH]);
}

module translate_x(x) {
  translate([x, 0])
  children();
}

module translate_y(y) {
  translate([0, y])
  children();
}
