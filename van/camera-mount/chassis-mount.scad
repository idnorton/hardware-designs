/**

Brackets for Teyes reversing camera - chassis mount
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Perimiters: 4
Seam position: Random

**/

bracket_spacing = 34.2;
bracket_d = 4.1;
bracket_thickness = 15;
bracket_height = 30;
bracket_width = bracket_spacing + (2*bracket_thickness) + 0;

bolt_spacing = 50;
bolt_d = 4.1;

post_width = 8;

$fn = 50;

difference() {
    union() {
        translate([0 - (bracket_width/2), 0, 0]) {
            cube([bracket_width, post_width, bracket_thickness]);
        }
    
        translate([0 - (bracket_width/2), 0, bracket_thickness/2]) {
            rotate([270, 0, 0]) cylinder(h = post_width, d = bracket_thickness);
        }

        translate([(bracket_width/2), 0, bracket_thickness/2]) {
            rotate([270, 0, 0]) cylinder(h = post_width, d = bracket_thickness);
        }
    }

    translate([(bracket_width/2), 0, bracket_thickness/2]) {
        rotate([270, 0, 0]) cylinder(h = post_width, d = bracket_d);
    }
    
    translate([0 - (bracket_width/2), 0, bracket_thickness/2]) {
        rotate([270, 0, 0]) cylinder(h = post_width, d = bracket_d);
    }
}

translate([0 - (bracket_spacing/2) - bracket_thickness/2, post_width, 0]) {
    post();
}

translate([(bracket_spacing/2), post_width, 0]) {
    post();
}

module post() {
    difference() {
        union() {
            cube([post_width, bracket_height, bracket_thickness]);

            translate([post_width/2, bracket_height, bracket_thickness/2]) {
                rotate([0, 90, 0]) {
                    cylinder(h = post_width, d = bracket_thickness, center = true);
                }
            }
        }
        
        translate([0, bracket_height, bracket_thickness/2]) {
            rotate([0, 90, 0]) {
                cylinder(h = (bracket_thickness * 2), d = bracket_d, center = true);
            }
        }
    }
    

}