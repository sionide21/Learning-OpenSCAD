$fa = 1;
$fs = 0.5;

WIDTH = 150;
CURVE = 3;

difference() {
  body();

  translate([0, 0, 3])
  tools();

  for (i=[0:3]) {
    translate([3.5 + 36 * i, 70 - 30, 1])
    cutout();
  }

  long_tool_mounts();

  translate([0, 50, 0])
  mirror([0, 1, 0])
  long_tool_mounts();

  short_tool_mounts();

  translate([150, 0, 0])
  mirror([1, 0, 0])
  short_tool_mounts();
}


module long_tool_mounts(width=WIDTH, count=12) {
  padding = (width - count * 12) / 2;

  translate([padding, 50, 80])
  for(x=[0:count-1]) {
    translate([x * 12, -3, 0])
    mount();
  }
}

module short_tool_mounts(count=3) {
  padding = (50 - count * 12) / 2;

  translate([0, padding, 80])
  for(y=[0:count-1]) {
    translate([3, y * 12, 0])
    rotate(90)
    mount();
  }
}

module mount(r=0.2, h=20) {
  translate([1, 0, 0])
  outline() {
    union() {
      cylinder(r=r, h=h);

      translate([10, 0, 0])
      cylinder(r=r, h=h);
    }

    translate([2.5, 1, 0])
    union() {
      cylinder(r=r, h=h);

      translate([5, 0, 0])
      cylinder(r=r, h=h);
    }

    translate([2.5, 3, 0])
    union() {
      cylinder(r=r, h=h);

      translate([5, 0, 0])
      cylinder(r=r, h=h);
    }
  }
}

module cutout() {
  translate([0, -1, 0])
  hull() {
    translate([0, 14, 30])
    panel(35, 5)
    foot();

    panel(35, 29)
    foot(h=15);
  }
}

module tools() {
  translate([7 + 26/2, 25, 0])
  cylinder(d=26, h=100);

  translate([7 + 26 + 15 + 15 / 2, 25, 42.5])
  cylinder(d=15, h=100);

  translate([78, 7, 40])
  panel(65, 16)
  foot(h=100);

  translate([78, 27, 45])
  panel(65, 16)
  foot(h=100);
}

module body() {
  outline() {
    panel(WIDTH, 70)
    foot();

    translate([0, 0, 30])
    panel(WIDTH, 50)
    foot();

    translate([0, 0, 100 - CURVE])
    panel(WIDTH, 50)
    sphere(r=CURVE);
  }
}

module outline() {
  for (x=[0:$children-2]) {
    hull() {
      children(x);
      children(x+1);
    }
  }
}

module foot(h=1) {
  cylinder(r=CURVE, h=h);
}

module panel(w, l) {
  hull() {
    for (x=[CURVE, w - CURVE]) {
      for (y=[CURVE, l - CURVE]) {
        translate([x, y, 0])
        children();
      }
    }
  }
}
