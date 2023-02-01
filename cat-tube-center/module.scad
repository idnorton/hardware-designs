/*

Cardboard tube center for making cat trees
@idnorton
2022-07-24

Usage:

id    - Internal diameter of cardboard tube
od    - External diameter of cardboard tube. When supplied, becomes an end cap
screw - Diameter of screw hole fixings

Example command line usage:

  openscad -D id=76 -D od=87 -D screw=4.5 module.scad -o 76mm-id-87mm-od-stl

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial environment

*/

// Default values for CLI params
id = 0;
od = 0;
screw = 0;

// Cardboard tube center
tube_insert_h = 14;
tube_insert_taper = 3;

// Bolt dimensions
bolt_diameter = 8;
bolt_head_d = 15;
bolt_head_h = 6.5;

module tube_center(
  id = 102,
  od = 0,
  screw = 4.5,
  ) {
  difference() {

    // Main body of insert
    union() {
      // Bottom taper
      cylinder(tube_insert_h*0.25, d1=id-tube_insert_taper, d2=id, $fn=1000);

      // Top cylinder
      translate([0, 0, tube_insert_h*0.25]) {
        cylinder(tube_insert_h*0.75, d=id, $fn=1000);
      }

      // Pointy bits to stop tube rotation
      translate([0, 0, tube_insert_h*0.25]) {
        cylinder(tube_insert_h*0.75, d1=id, d2=id+0.5, $fn=6);
      }

      // Flange
      if (od > 0) {
        translate([0, 0, tube_insert_h]) {
          cylinder(bolt_head_h, d=od, $fn=1000);
        }
      }
    }

    // Hole through the middle
    cylinder(tube_insert_h, d=(bolt_diameter + 0.2), $fn=200);

    // Bolt head clearance
    translate([0, 0, tube_insert_h - bolt_head_h]) {
      cylinder(bolt_head_h*2, d=bolt_head_d, $fn=6);
    }

    if (screw > 0) {
      // Left screw
      translate([-(id/4), 0, 0]) {
        screw(d = screw);
      }

      // Right screw
      translate([(id/4), 0, 0]) {
        screw(d = screw);
      }
    }
  }
}

module screw(d = 4.5) {
  // Screw through hole
  cylinder(
    $fn=100,
    h=tube_insert_h*2,
    d=d,
    center=false
  );

  // Countersink for screw head
  cylinder(
    $fn=100,
    h=d,
    d1=10,
    d2=0,
    center=false
  );
}

tube_center(
  id = id,
  od = od,
  screw = screw
);