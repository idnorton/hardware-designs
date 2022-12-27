/*
  
Bravilor B5 HW-5 hot water tank lid repair
@idnorton
2022-09-11

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use

*/

// Rounding for cylinders
fn = 250;

// Height of the lid lip
h = 13.4;

// Internal tapers
id_top = 141.9;
id_bottom = 142.8;

// External tapers
od_top = 145.9;
od_bottom = 145.3;

// Latch
latch_h = 2.5;
latch_d = od_top + 3;
latch_top = od_top + 2;
latch_bottom = od_bottom + 2;

union () {        
    difference () {
        intersection () {
            // Sticking out lump
            translate([0, 0, 5]) {
                cylinder(latch_h, d=latch_d, $fn=fn);
            }
            
            // Cube intersection
            translate([-15, 0, 0]) {
                cube([30, 90, h]);
            }
        }
        
        // Remove the center of the cylinder
        translate([0, 0, 5]) {
            cylinder(latch_h, d1=id_top, d2=id_bottom, $fn=fn);
        }
    }

    intersection () {
        // Cube intersection
        translate([-15, 0, 0]) {
            cube([30, 90, h]);
        }

        // Match existing rim
        difference () {
            cylinder(h-1, d1=od_bottom, d2=od_top, $fn=fn);
            cylinder(h-1, d1=id_bottom, d2=id_top, $fn=fn);
        }
    }

    // Match existing rim
    difference () {
        cylinder(h, d1=id_bottom, d2=id_top, $fn=fn);
        cylinder(h, d1=id_bottom - 2, d2=id_top - 2, $fn=fn);
    }
}