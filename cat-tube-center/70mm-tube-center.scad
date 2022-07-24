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
tube_insert_d = 70;
tube_insert_h = 20;

// Bolt dimensions
bolt_diameter = 8;
bolt_head = 15;


difference() {
    // Main body of insert
    cylinder(tube_insert_h, d=tube_insert_d, $fn=100);

    // Hole through the middle
    cylinder(tube_insert_h, d=bolt_diameter, $fn=100);

    // Bolt head clearance
    cylinder(bolt_diameter, bolt_head/2, bolt_head/2, $fn=6);
}