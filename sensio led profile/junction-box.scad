/**

Sensio aluminium profile LED termination
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

d = 32;

x = 65;
y = 25;
z = 25;

thickness = 2;



difference() {
    cube([x, y, z]);
    
    // Hole for extrusion
    translate([10, 2, 2]) {
        rotate([0,270,0]) {
            quadrant();
        }
    }
    
    // Hollow out the inside
    translate([2, 2, 2]) {
        cube([x - (2*thickness), y - (2 * thickness), z - (2 * thickness)]);
    }
    
    // Cable gland
    translate([x - thickness, y/2, z/2]) {
        rotate([0, 90, 0]) {
            cylinder(h = 50, d = 12, $fn=40);
        }
    }
}



module quadrant() {
    intersection() {
        cylinder(h = 10, d = 32, $fn = 50); 
        cube(d/2);
    }
}