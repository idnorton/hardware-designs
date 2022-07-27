/*
  
Banner mounting bracket for poles
@idnorton
2022-06-22

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial event

*/

// Scaffold pole is 48.3mm or 2 inches

// Body dimensions
body_x = 50;
body_y = 100;
body_z = 15;

bolt_diameter = 8;
pole_diameter = 8;

module body_top () {

    difference() {
        union() {
            // Big square body
            cube([body_x, body_y, 5]);

            // Big round top
            translate([body_x/2,0,5]) {
                rotate([270,0,0]) {
                    cylinder(body_y,d=body_x, $fn=100);
                }
            }
            
            // Top boss for spring
            translate([body_x/2, body_y*0.65, 0]) {
                cylinder(body_z+20,d1=bolt_diameter+30,d2=bolt_diameter+6,$fn=100);
            }
            
            // Bottom boss for banner pole
            translate([body_x/2, body_y*0.35, 10]) {
                cylinder(h=50, d1=body_x-1, d2=body_z, $fn=100);
            }            
        }
    
        // Flatten the bottom
        translate([0,0,-20]) {
            cube([body_x, body_y, 20]);
        }

        // Bottom triangle
        translate([body_x/2, 0, 17]) {
            rotate([270,45,0]) {
                cube([body_x/2, body_x/2, body_y]);
            }
        }
        
        // Hole for bolt
        translate([body_x/2, body_y*0.65, 0]) {
            cylinder(body_z + 100,d=bolt_diameter, $fn=100);
        }

        // Hole for banner pole
        translate([body_x/2, body_y*0.35, 22]) {
            cylinder(h=60,d=pole_diameter, $fn=100);
        }  
    }   
}

body_top();