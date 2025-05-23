/**

Mounting frame for 6 way fuse box with relays

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Print settings: 0.3mm DRAFT
Supports:       None
Infill:         15%
Perimeters:     4

**/

x = 84;
y = 124.5;
z = 1.5;
x_mounting = 72;
y_mounting = 112.5;
hole = 5.6;
boss = 12;

x_offset = (x - x_mounting)/2;
y_offset = (y - y_mounting)/2;

difference() {
    cube([x, y, z]);
    translate([boss, boss, 0]) cube([x - (2*boss), y - (2*boss), z]);
    translate([x_offset, y_offset, 0]) cylinder(h = z, d = hole, $fn = 100);
    translate([x_offset, y_offset + y_mounting, 0]) cylinder(h = z, d = hole, $fn = 100);
    translate([x_offset + x_mounting, y_offset + y_mounting, 0]) cylinder(h = z, d = hole, $fn = 100);
    translate([x_offset + x_mounting, y_offset, 0]) cylinder(h = z, d = hole, $fn = 100);
}

translate([x_offset, y_offset, 0]) boss();
translate([x_offset, y_offset + y_mounting, 0]) boss();
translate([x_offset + x_mounting, y_offset + y_mounting, 0]) boss();
translate([x_offset + x_mounting, y_offset, 0]) boss();

module boss() {
    difference() {
        h = 8;
        insert = 5.6;
        
        cylinder(h = h, d = boss, $fn = 100);     // Body of the boss
        translate([0, 0, h - z]) cylinder(h = z, d = 8.5, $fn = 100); // Insert in the top
        cylinder(h = h, d = insert, $fn = 100); // Hole for the heat press insert
    }
}