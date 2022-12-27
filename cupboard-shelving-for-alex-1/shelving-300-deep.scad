/*

Cat climbing wall - wall bracket jig
@idnorton
2021-10-23

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build these for your own use :)

*/


// Board thickness and saw kerf
thickness = 18;
kerf = 2;

// Overall size of cupboard
x_size = 1085;
y_size = 885;
z_size = 1465;

// top & bottom of the cupboard
translate([0, 0, z_size]) {top_bottom(x_size, y_size, thickness);};
translate([0, 0, -thickness]) {top_bottom(x_size, y_size, thickness);};

// Box size
x_box = 412;
y_box = 600;
z_box = 270;

boxes_wide = 2;
boxes_high = 3;

for ( i = [ 0 : 1 : boxes_high ] ) {
    translate([0, y_size - y_box, (i * (z_box + thickness))]) {
        shelf();
    }
}

module shelf () {
    
    // bottom of shelf
    cube([
        (thickness + (boxes_wide * (x_box + thickness))),
        y_box,
        thickness
    ]);

    
    for ( i = [ 0 : 1 : boxes_wide ] ) {
        
        x = (i * (x_box + thickness));
        //echo("Vertical position:");
        //echo(x);
        
        // Vertical front to back
        translate([
            x,
            0,
            thickness + kerf
        ]) {
            cube([
                thickness,
                y_box,
                z_box - (2 * kerf)
            ]);
        }
    }
    
    for ( i = [ 0 : 1 : boxes_wide - 1 ] ) {
        
        x = thickness + kerf + (i * (x_box + thickness));
        //echo("Back panel position: ");
        //echo(x);
        
        // Back panel
        translate([
            x,
            y_box - thickness,
            thickness + kerf
        ]) {
            cube([
                x_box - (2*kerf),
                thickness,
                z_box - (2*kerf)
            ]);
        }
    }
}

// top of shelf
translate([0, y_size - y_box, ((boxes_high + 1) * (z_box + thickness))]) {
    cube([
        ((x_box + thickness) * boxes_wide) + thickness,
        y_box,
        thickness
    ]);
}

module top_bottom (x, y, thickness) {
    color("green") {
        cube(size = [x, y, thickness]);
    }
}

