/**

Sensio aluminium profile LED termination
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

* Change to module in order to have two instances one mirrored
* Add lip into extrusion hole 5mm in to stop the extrusion going in further
* Add support clips to the design

**/

d = 34;

x = 65;
y = 25;
z = 25;

thickness = 2;

screw = 4;

difference() {
    cube([x, y, z]);

    // Hollow out the inside
    translate([2, 2, 2]) {
        cube([x - (2*thickness), y - (2 * thickness), z - (2 * thickness)]);
    }

    // Hole for extrusion
    translate([x - thickness, thickness, z - thickness]) {
        rotate([0,90,0]) {
            quadrant();
        }
    }

    // Cable hole
    translate([y/2, y, z/2]) {
        rotate([90, 0, 0]) {
            cylinder(h = (2 * thickness), d = 12, $fn=40);
        }
    }
}

difference() {
    // Mounting plate
    translate([-y, 0, 0]) {
        cube([x * 2, y, thickness]);
    }

    // Mounting holes
    translate([-y/2, y/2, 0]) {
        cylinder(h = thickness + 2, d = screw, $fn = 50);
    }

    // Mounting hole profile side
    translate([x + (y/2), y/2, 0]) {
        cylinder(h = 10, d = screw, $fn = 50);
    }

    // Slot profile side
    translate([x + (y/2), y/2 - (screw/2), 0]) {
        cube([x, screw, thickness + 2]);
    }
}

module quadrant() {
    intersection() {
        cylinder(h = 10, d = d, $fn = 50);
        cube(d/2);
    }
}
