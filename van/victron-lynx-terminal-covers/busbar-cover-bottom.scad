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
busbar_hole = 8.8;
busbar_hole_offset = 13.5;

insulator_x = 38;
insulator_y = 12;
insulator_z = 17;

insulator_groove_x = 34;
insulator_groove_y = 3;
insulator_groove_z = 12;
insulator_groove_inset = 2;

case_base = 8;
case_thickness = 2;
case_x = insulator_x + (2*case_thickness);
case_y = 70;
case_z = 10;

bolt_head = 15;
bolt_washer = 16;

cabletie_x = 2;
cabletie_y = 6;

cable_entry = 18;
cable_crimp_groove = 66;

difference() {
    // Main external body
    cube([case_x, case_y, case_z + case_base]);

    // Insulator gap
    translate([case_thickness, case_y - insulator_y, 2]) {
        cube([insulator_x, insulator_y, insulator_z]);
    }

    // Main body opening for busbar
    translate([(case_x - busbar_x)/2, case_thickness*2, case_base]) {
        cube([busbar_x, case_y, busbar_z*2]);
    }

    // Cable entry
    translate([case_x/2, 0, 12]) {
        rotate([90, 0, 0]) {
           cylinder(h = cable_crimp_groove, d = cable_entry, center = true, $fn=100);
        }
    }

    // Bolt head
    translate([case_x/2, case_y - 25, case_base/2]) {
        cylinder(h = case_thickness*6, d = bolt_head, center = true, $fn=6);
    }

    // Washer
    translate([case_x/2, case_y - 25, case_base - 0.5]) {
        cylinder(h = 2, d = bolt_washer, center = true, $fn=100);
    }

    // Top cable tie hole
    translate([case_thickness*3, case_thickness* 2, 0]) {
        cube([cabletie_x, cabletie_y, case_base + case_thickness]);
    }

    // Bottom cable tie hole
    translate([case_x - (case_thickness*3) - cabletie_x, case_thickness* 2, 0]) {
        cube([cabletie_x, cabletie_y, case_base + case_thickness]);
    }

    // Cable tie channel on bottom
    translate([case_thickness*3, case_thickness* 2, 0]) {
        cube([case_x - (case_thickness*6), cabletie_y, cabletie_x]);
    }
}

// Tabs above busbar left
translate([0, case_y - insulator_y - 6, (case_z+case_base) - case_thickness]) {
    cube([7, 6, case_thickness]);
}

// Tabs above busbar right
translate([case_x - 7, case_y - insulator_y - 6, (case_z+case_base) - case_thickness]) {
    cube([7, 6, case_thickness]);
}
