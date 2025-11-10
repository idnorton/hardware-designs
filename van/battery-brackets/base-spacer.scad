/**

Brackets for mounting Eco Worthy 12v 100Ah LiPo4

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

x = 20;
y = 150;
z = 5;

hole_bolt = 8.5;
hole_screw = 4;

difference() {
    // Main body
    cube([x, y, z]);
    
    // Bolt hole
    translate([x/2, y/2, 0]) {
        cylinder(h = z*2, d = hole_bolt, center = true, $fn = 50);
    }
    
    // Screw holes
    translate([x/2, x/2, 0]) {
        cylinder(h = z*2, d = hole_screw, center = true, $fn = 50);
    }
    // Screw holes
    translate([x/2, y - (x/2), 0]) {
        cylinder(h = z*2, d = hole_screw, center = true, $fn = 50);
    }   
}