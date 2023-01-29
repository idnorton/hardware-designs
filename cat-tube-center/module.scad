/*

Cardboard tube center for making cat trees
@idnorton
2022-07-24

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial environment

*/

// Cardboard tube center
tube_insert_h = 14;
tube_insert_taper = 3;

// Bolt dimensions
bolt_diameter = 8;
bolt_head_d = 15;
bolt_head_h = 6.5;

module tube_center(
  d = 102,
  flange = 0,
  ) {
  difference() {

    // Main body of insert
    union() {
      // Bottom taper
      cylinder(tube_insert_h*0.25, d1=d-tube_insert_taper, d2=d, $fn=1000);

      // Top cylinder
      translate([0, 0, tube_insert_h*0.25]) {
        cylinder(tube_insert_h*0.75, d=d, $fn=1000);
      }

      // Pointy bits to stop tube rotation
      translate([0, 0, tube_insert_h*0.25]) {
        cylinder(tube_insert_h*0.75, d1=d, d2=d+0.4, $fn=6);
      }

      // Flange
      if (flange > 0) {
        translate([0, 0, tube_insert_h]) {
          cylinder(bolt_head_h, d=d+6, $fn=1000);
        }
      }
    }

    // Hole through the middle
    cylinder(tube_insert_h, d=(bolt_diameter + 0.2), $fn=200);

    // Bolt head clearance
    translate([0, 0, tube_insert_h - bolt_head_h]) {
      cylinder(bolt_head_h*2, d=bolt_head_d, $fn=6);
    }

    // Left screw
    translate([-(d/4), 0, 0]) {
      screw();
    }

    // Right screw
    translate([(d/4), 0, 0]) {
      screw();
    }
  }
}

module screw() {
  // Screw through hole
  cylinder(
    $fn=100,
    h=tube_insert_h*2,
    d=4.5,
    center=false
  );

  // Countersink for screw head
  cylinder(
    $fn=100,
    h=4,
    d1=10,
    d2=0,
    center=false
  );
}

tube_center(
  d = 76,
  flange = 88
);