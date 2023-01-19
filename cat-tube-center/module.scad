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
tube_insert_h = 10;
tube_insert_taper = 3;

// Bolt dimensions
bolt_diameter = 8;
bolt_head = 15;

module tube_center(
  d = 102,
  ) {
  difference() {

    // Main body of insert
    union() {  
      // Bottom taper
      cylinder(tube_insert_h/2, d1=d-tube_insert_taper, d2=d, $fn=1000);
      
      // Top cylinder
      translate([0, 0, tube_insert_h/2]) {
        cylinder(tube_insert_h/2, d=d, $fn=1000);
      }
    }

    // Hole through the middle
    cylinder(tube_insert_h, d=(bolt_diameter + 0.1), $fn=200);

    // Bolt head clearance
    translate([0, 0, tube_insert_h/2]) {
      cylinder(tube_insert_h/2, bolt_head/2, bolt_head/2, $fn=6);
    }
  }
}

// tube_center(d = 102);