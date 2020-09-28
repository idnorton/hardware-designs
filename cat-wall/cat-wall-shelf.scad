/*

Cat climbing wall - wall bracket jig
@idnorton
2020-08-30

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build these for your own cats :)

*/

module shelf(
    width = 450,
    thickness = 18,
    kerf = 0.1,
    ) {

    // Bottom
    translate([0, 0, 0]) {
        square([width, thickness]);
    }

    // Depth is always a calculation
    depth = 150 + 2*thickness;
    
    // Left side
    translate([0, thickness + kerf, 0]) {
        square([thickness, depth - (2*thickness) - (2*kerf)]);
    }
    
    // Right side
    translate([width - thickness, thickness + kerf, 0]) {
        square([thickness, depth - (2*thickness) - (2*kerf)]);
    }
    
    // Top side
    translate([0, depth - thickness, 0]) {
        square([width, thickness]);
    }
    
    difference() {
        
        // Shelf surface
        translate([thickness + kerf, thickness + kerf]) {
            square([width - (2*kerf) - (2*thickness), depth - (2*kerf) - (2*thickness)]);
        }
        
        // Text
        translate([2*thickness, depth - (3*18)]) {
            text(str("A - ", thickness,
                     " x ", 2*thickness,
                     " x ", depth - (2*thickness)
            ));
        }

        translate([2*thickness, depth - (4*18)]) {
            text(str("B - ", thickness,
                     " x ", 2*thickness,
                     " x ", width
            ));
        }
        
        translate([2*thickness, depth - (5*18)]) {
            text(str("C - ",thickness,
                     " x ", depth - (2*thickness),
                     " x ", width - (2*thickness)
            ));
        }
    
        translate([2*thickness, depth - (6*18)]) {
            text(str("D - ",thickness,
                     " x ", (3*thickness),
                     " x ", width
            ));
        }
        
        // Test holes
        
    }
    
}

shelf();