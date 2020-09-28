/*

Cat climbing wall
@idnorton
2020-08-30

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build these your own cats :)

*/

// Grid centres
grid = 100;

board_width = 250;
board_thickness = 12;

// Diameter of the fixing holes
hole = 5;

difference() {

    // Main body
    square([board_width, board_thickness * 3]);
    
    for ( x = [ 25 : grid : board_width ] ) {
        // Hole
        translate([x, 2 * board_thickness ,0]) {
            circle(d=hole, $fn=50);
        }
    }
  
}