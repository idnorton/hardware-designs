/**

Terminal covers for Victron Lynx Power In

@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Perimiters: 4
Seam position: Random

**/

busbar_x = 30;
busbar_y = 25;
busbar_z = 8;
busbar_hole = 8.8;
busbar_hole_offset = 13.5;

insulator_x = 38;
insulator_y = 12;
insulator_z = 16.5;

insulator_groove_x = 34;
insulator_groove_y = 3;
insulator_groove_z = 12;
insulator_groove_inset = 2;

// Busbar
difference() {
    translate([0-(busbar_x/2), 0-(busbar_y/2), 0-(busbar_z/2)]) { cube([busbar_x, busbar_y, busbar_z]); }

    // Bolt hole
    //translate([0, 0, (busbar_z/2)]) { cylinder(h = busbar_z*2, d=8.8, center=true, $fn=200); }
}

// Bolt head
translate([0, 0, 0-(busbar_z/2)-4]) { cylinder(h = 5.5, d=13, center=true, $fn=6); }

// washer
translate([0, 0, 0-(busbar_z/2)-0.5]) { cylinder(h = 1.5, d=15.6, center=true, $fn=200); }


difference() {
    translate([0-(insulator_x/2), busbar_y/2, 0-(insulator_z/2)]) {
        cube([insulator_x, insulator_y, insulator_z]);
    }

    // Top groove
    translate([0-(insulator_x/2), busbar_y/2 + insulator_groove_inset, (insulator_z/2) - insulator_groove_y]) {
        cube([insulator_x, insulator_groove_y, insulator_groove_y]);
    }

    // Bottom groove
    translate([0-(insulator_x/2), busbar_y/2 + insulator_groove_inset, 0-(insulator_z/2)]) {
        cube([insulator_x, insulator_groove_y, insulator_groove_y]);
    }

    // Left groove
    translate([0-(insulator_x/2), busbar_y/2 + insulator_groove_inset, 0-(insulator_z/2)]) {
        cube([insulator_groove_y, insulator_groove_y, insulator_groove_z*2]);
    }

    // Right groove
    translate([insulator_x/2-insulator_groove_y, busbar_y/2 + insulator_groove_inset, 0-(insulator_z/2)]) {
        cube([insulator_groove_y, insulator_groove_y, insulator_groove_z*2]);
    }


}
