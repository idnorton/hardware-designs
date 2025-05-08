/**

Generic enclosure for van stuff
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Print settings: 0.20mm SPEED
Supports: None
Infill: 20%
Perimiters: 3

**/

base_thickness = 1;
wall_thickness = 2;
wall_x = 210; // This needs to be an arg
wall_y = 150;
wall_z = 5;

gaps = 45;
corner = 20;
insert = 2;
support = 5;

difference() {
    // Exterior body
    cube([wall_x, wall_y, wall_z]);

    // Hollow out the main body
    translate([
      wall_thickness,
      wall_thickness,
      base_thickness
    ]) {
      cube([
        wall_x - (2 * wall_thickness),
        wall_y - (2 * wall_thickness),
        wall_z - base_thickness]);
    }

    // Remove cable route above to save on materials
    translate([20, 20, 0]) {
        cube([wall_x - gaps, wall_y/4, base_thickness]);
    }

    // Remove cable route below to save on materials
    translate([20, wall_y - 60, 0]) {
        cube([wall_x - gaps, wall_y/4, base_thickness]);
    }
    // Left side bottom gap
    translate([0, corner, 0]) {
        vgap();
    }

    // Left side top gap
    translate([0, wall_y - gaps - corner, 0]) {
        vgap();
    }

    // Right side bottom gap
    translate([
        wall_x - insert - wall_thickness,
        corner,
        0
    ]) {
        vgap();
    }

    // Right side top gap
    translate([
        wall_x - insert - wall_thickness,
        wall_y - gaps - corner,
        0
    ]) {
        vgap();
    }

    // Top side left gap
    translate([
        corner,
        wall_y - insert - wall_thickness,
        0
    ]) {
        hgap();
    }

    // Top side right gap
    translate([
        wall_x - gaps - corner,
        wall_y - insert - wall_thickness,
        0
    ]) {
        hgap();
    }

    // Bottom side left gap
    translate([corner, 0, 0]) {
        hgap();
    }

    // Bottom side right gap
    translate([wall_x - gaps - corner, 0, 0]) {
        hgap();
    }
}

// Supports
// Left edge
support(wall_thickness, wall_thickness);
support(wall_thickness, (wall_y/2) - (support/2));
support(wall_thickness, wall_y - wall_thickness - support);

// Middle
support((wall_x/3), wall_thickness);
support((wall_x/3), wall_y - wall_thickness - support);
support(((wall_x/3)*2) - support, wall_thickness);
support(((wall_x/3)*2) - support, wall_y - wall_thickness - support);

// Right edge
support(wall_x - wall_thickness - support, wall_thickness);
support(wall_x - wall_thickness - support, (wall_y/2) - (support/2));
support(wall_x - wall_thickness - support, wall_y - wall_thickness - support);

module support(x, y) {
    translate([x, y, 0]) {
        cube([support, support, wall_z]);
    }
}

module hgap() {
    cube([gaps, insert + wall_thickness, wall_z]);
}

module vgap() {
    cube([insert + wall_thickness, gaps, wall_z]);
}
