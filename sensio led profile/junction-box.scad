/**

Sensio aluminium profile LED termination
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

// LED profile diameter
d = 34;

// Box size
x = 65;
y = 25;
z = 25;

// Thickness of walls and plates
thickness = 2;

// Fixing hole diameters
screw = 4;

// One box
box();
fixings();

// Mirror of the first box for the other end of profile
translate([0, y * 2.5, 0]) {
    mirror([0, 180, 0]) {
        box();
        fixings();
    }
}

// Generate multiple support brackets
for(i = [-y : y + 2*thickness : y * 3]) {
    translate([i, 3 * y, 0]) {
        support();
    }
}

module box() {
    difference() {
        cube([x, y, z]);
    
        // Hollow out the inside
        translate([thickness, thickness, thickness]) {
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
    
    // End stop for profile, 5mm in from the edge
    translate([x - 10, 0, z - 5]) {
        cube(5);
    }
}

module fixings() {
    difference() {
        // Mounting plate
        translate([-y, 0, 0]) {
            cube([x + (y * 2), y, thickness]);
        }
    
        // Fixed point mounting hole
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
}

module quadrant() {
    intersection() {
        cylinder(h = 10, d = d, $fn = 50);
        cube(d/2);
    }
}

module support() {
    // Base
    cube([y, y, thickness]);
    
    difference() {
        // Back
        cube([y, (y - thickness - d/2), z]);

        // Mounting hole
        translate([y/2, 0, z/2]) {
            rotate([270, 0, 0]) {
                cylinder(h = 3 * thickness, d = screw, $fn = 50);
            }
        }
   
        // Screw head recess
        translate([y/2, (y - thickness - d/2 - (2 * thickness)), z/2]) {
            rotate([270, 0, 0]) {
                cylinder(h = 3 * thickness, d = 2 * screw, $fn = 50);
            }
        }    
    }
        
    // Front lip
    translate([0, y - thickness, 0]) {
        cube([y, thickness, 2 * thickness]);
    }
    
    // Top lip
    translate([0, y - thickness - d/2, z - thickness]) {
        cube([y, thickness, thickness]);
    }
}