/**

Sensio aluminium profile LED termination
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

d = 34;

x = 65;
y = 25;
z = 25;

thickness = 2;

difference() {
    cube([x, y, z]);

    // Hollow out the inside
    translate([2, 2, 2]) {
        cube([x - (2*thickness), y - (2 * thickness), z - (2 * thickness)]);
    }

    // Hole for extrusion
    translate([x, y - (d/2) - thickness, 2]) {
        rotate([0,270,0]) {
            quadrant();
        }
    }

    // Cable gland
    translate([0, y/2, z/2]) {
        rotate([0, 90, 0]) {
            cylinder(h = 50, d = 12, $fn=40);
        }
    }
}

difference() {
    // Mounting plate
    translate([0, y-thickness, z]) {
        cube([x, thickness, z/2]);
    }

    // Mounting holes
    translate([x*0.2, y, z * 1.25]) {
        rotate([90, 0, 0]) {
            cylinder(h = 10, d = 4, $fn = 50);
        }
    }

    // Mounting holes
    translate([x*0.8, y, z * 1.25]) {
        rotate([90, 0, 0]) {
            cylinder(h = 10, d = 4, $fn = 50);
        }
    }
}

module quadrant() {
    intersection() {
        cylinder(h = 10, d = d, $fn = 50);
        cube(d/2);
    }
}
