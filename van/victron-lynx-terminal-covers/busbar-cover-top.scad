/**

Terminal covers for Victron Lynx Power In

@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Perimiters: 6
Seam position: Random
Infill: 30%

**/

busbar_x = 30;
busbar_y = 25;
busbar_z = 8;

bolt = 8.5;

cable_entry = 18;
case_base = 8;

case_thickness = 2;
case_x_thickness = 6;

case_x = busbar_x + (2 * case_x_thickness);
case_y = 70;
case_z = 12;

insulator_x = 38;
insulator_y = 12;
insulator_z = 17;

insulator_groove_x = 34;
insulator_groove_y = 3;
insulator_groove_z = 12;
insulator_groove_inset = 2;


difference() {
    // Main external body
    cube([busbar_x + (2 * case_x_thickness), case_y, case_z]);

    // Terminal insulator next to body
    translate([case_thickness, case_y - insulator_y, case_z - 3]) {
        cube([insulator_x, insulator_y, insulator_z]);
    }

    // Main body opening for busbar
    translate([case_x_thickness, case_thickness, case_thickness]) {
        cube([busbar_x, case_y - insulator_y, busbar_z*2]);
    }

    // Through bolt hole for securing
    translate([case_x/2, case_y - 25, 0]) {
        cylinder(h = case_z * 6, d = bolt, center = true, $fn=50);
    }

    // Cable entry (only a little bit to match the one in the bottom half
    translate([case_x/2, 0, case_z + 6]) {
        rotate([90, 0, 0]) {
           cylinder(h = 10, d = cable_entry, center = true, $fn=100);
        }
    }
}

// Tab to lock to base
translate([case_x_thickness, case_thickness * 2, 0]) {
    cube([2, 28, case_z + case_thickness]);
}

// Tab to lock to base
translate([case_x - (case_x_thickness + 2), case_thickness * 2, 0]) {
    cube([2, 28, case_z + case_thickness]);
}
