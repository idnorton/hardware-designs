/**

Brackets for Ikea LÖNSET Slatted bed base,
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

length = 38;
screws = 4.5;
thickness = 4;
height_top = 38;
width_top = 22;
width_bottom = 40;

offset = (width_top - width_bottom)/2;

difference() {
    // Top outer
    translate([-(length/2), -((width_top + 2*thickness)/2)+offset, -(thickness/2)]) {
        cube([length, width_top + (2 * thickness), height_top + thickness]);
    }

    // Top slot
    translate([-(length/2), -(width_top/2)+offset, (thickness/2)]) {
        cube([length, width_top, height_top]);
    }

    // Screw holes
    translate([0, 0 + offset, (height_top/2)+(thickness/2)]) {
        // Central hole
        screw(h = (2 * width_top));
    }

    translate([-8, 0 + offset, (height_top/2)+(thickness/2)]) {
        // Offset hole #1
        //screw(h = (2 * width_top));
    }

    translate([8, 0 + offset, (height_top/2)+(thickness/2)]) {
        // Offset hole #2
        //screw(h = (2 * width_top));
    }
}

module screw(h) {
    rotate([90, 0, 0]) {
        cylinder(h=h, d=screws, center=true, $fn=50);
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
