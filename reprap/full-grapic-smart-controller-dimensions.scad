/*

Reprap Full Graphic Smart Controller board

@lunecrafts
2018-07-07

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build for your own commercial workshop :)

*/

// Diameter of mounting holes
mounting_holes = 3;

module reprap_display () {

    
    // Mounting holes
    translate([2.5, 19, 0]) { circle(d = mounting_holes, $fn=50); }
    translate([90.5, 19, 0]) { circle(d = mounting_holes, $fn=50); }
    translate([2.5, 84, 0]) { circle(d = mounting_holes, $fn=50); }
    translate([90.5, 84, 0]) { circle(d = mounting_holes, $fn=50); }
    
    // Display
    translate([8, 27, 0]) { square([78, 51]); }

    // Contrast
    translate([10, 12, 0]) { circle(d = 6, $fn=50); }
    
    // Reset button
    translate([50, 9, 0]) { circle(d = 3, $fn=50); }

    // Rotary encoder
    translate([83.5, 9, 0]) { circle(d = 12.6, $fn=50); }
}

// Overall PCB dimensions
panel_x = 93;
panel_y = 87;

difference() {
    
    // Body of the panel
    square([panel_x,panel_y]);

    reprap_display();
}
