/**

Brackets for Ikea LÖNSET Slatted bed base,
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

length = 40;
screws = 4;
thickness = 2;
width_top = 42;
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

    // Screw holes?
    //translate([-6, -((width_top + 2*thickness)/2), (width_top/2)]) {
    translate([-8, 0, (width_top/2)]) {
        screw(h = width_top + (2*thickness));
    }
    translate([8, 0, (width_top/2)]) {
        screw(h = width_top + (2*thickness));
    }
}

module screw(h) {
    rotate([90, 0, 0]) {
        cylinder(h=h, d=screws, center=true);
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

    // Screw holes?
    translate([-8, 0, -(width_bottom/2)]) {
        screw(h = width_bottom + (2*thickness));
    }
    translate([8, 0, -(width_bottom/2)]) {
        screw(h = width_bottom + (2*thickness));
        //screw();
    }
}