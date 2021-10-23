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

// Overall board size - ideally a multiple of grid
x_board = 750;
y_board = 250;

// Diameter of the fixing holes
hole = 6;

x_grid_offset = grid/2;
y_grid_offset = grid/2;

x_grid_offset = 25;
y_grid_offset = 25;

difference() {

    // Main body
    square([x_board, y_board]);
    
    // Captive nut mounting holes
    for ( x = [ x_grid_offset : grid : x_board ] ) {
        for ( y = [ y_grid_offset : grid : y_board ] ) {
            // Hole
            translate([x,y,0]) { circle(d=hole, $fn=50); }
        }
    }
    
    // Board mounting holes
    
}