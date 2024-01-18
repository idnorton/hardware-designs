/**

Brackets for Ikea LÖNSET Slatted bed base,
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

length = 40;
thickness = 2;
width_top = 21;
width_bottom = 38;

difference() {
    // Top outer
    translate([-(length/2), -((width_top + 2*thickness)/2), -(thickness/2)]) {
        cube([length, width_top + (2 * thickness), width_top]); 
    }
    
    // Top slot
    translate([-(length/2), -(width_top/2), (thickness/2)]) {
        cube([length, width_top, width_top]);
    }
}

difference() {
    // Bottom outer
    translate([-(length/2), -(width_bottom + 2*thickness)/2, -(width_bottom - (thickness/2))]) { 
        cube([length, width_bottom + (2 * thickness), width_bottom]); 
    }
    
    // Bottom slot
    translate([-(length/2), -(width_bottom/2), -(width_bottom + (thickness/2))]) {
        cube([length, width_bottom, width_bottom]);
    }
}