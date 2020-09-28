/*

Cat climbing wall - wall bracket jig
@idnorton
2020-08-30

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build these for your own cats :)

*/

module wall_bracket(
    // Grid centres
    grid = 100,
    board_width = 250,
    board_thickness = 12,
    ) {
    
    // Diameter of the fixing holes to backboard
    backboard_hole = 7;
    
    difference() {
    
        // Wall body
        square([board_width, board_thickness * 3]);
        
        // Holes to screw to back board
        for ( x = [ 25 : grid : board_width ] ) {
            translate([x, 2 * board_thickness ,0]) {
                circle(d=backboard_hole, $fn=50);
            }
        }
        
        // Hole for mounting shelf to wall bracket
        mount_hole = 4.5;
        
        // Inset the edge holes this amount
        mount_padding = 30;
        
        // Number of shelf to bracket mounting holes
        mount_holes = 5;
        
        // Calculate hole spacing based on above
        mount_spacing = (board_width - 2 * mount_padding)/(mount_holes - 1);

        // Holes for mounting to shelf
        for ( x = [ mount_padding : mount_spacing : board_width ] ) {
            translate([x, board_thickness/2, 0]) {
                circle(d=mount_hole, $fn=50);
            }
        }      
    }
}

// Width of guide border
border = 20;

// Width of the wall board and thickness
board_width = 250;
board_thickness = 12;

// Kerf
kerf = 0.1;

// Border
color("red") {
    square([border - kerf, 3 * board_thickness + border]);
    square([board_width + border, border - kerf]);
}

// Wall bracket
translate([border, border, 0]) {
    wall_bracket(
        board_width = board_width,
        board_thickness = board_thickness
    );
}