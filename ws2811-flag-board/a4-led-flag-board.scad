/*

LED Flag using WS2811
@idnorton
2020-08-30

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build these your own cats :)

*/

// Overall board size - ideally a multiple of grid
x_board = 297;
y_board = 210;

x_board = 600;
y_board = 400;


// Grid centres
x_grid = x_board/10;
y_grid = y_board/5;

// Diameter of the fixing holes
hole = 12;

difference() {

    // Main body
    square([x_board, y_board]);
    
    for ( x = [ x_grid/2 : x_grid : x_board ] ) {
        for ( y = [ y_grid/2 : y_grid : y_board ] ) {
            // Hole
            translate([x,y,0]) { circle(d=hole, $fn=50); }
        }
    }
  
}