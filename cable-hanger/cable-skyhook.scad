cable_diameter = 12;


difference() {
    cylinder(h = cable_diameter * 5, d = cable_diameter + 5, $fn = 200);
    cylinder(h = cable_diameter * 5, d = cable_diameter, $fn = 200);
    
    translate([0 - cable_diameter, 0 - (cable_diameter/4), cable_diameter]) {
        cube([cable_diameter * 5, cable_diameter, cable_diameter]);
    }
    
    translate([0 - cable_diameter, 0 - (cable_diameter/4), cable_diameter*3]) {
        cube([cable_diameter * 5, cable_diameter, cable_diameter]);
    }
    
    
    translate([0, -3, 0]) {
        cube([cable_diameter, cable_diameter, cable_diameter]);
    }
    
    translate([-13, -3, cable_diameter*2]) {
        cube([cable_diameter, cable_diameter, cable_diameter]);
    }
    
    translate([0, -3, cable_diameter*4]) {
        cube([cable_diameter, cable_diameter, cable_diameter]);
    }
}

translate([4, 0 - (cable_diameter/2), ((cable_diameter*5)/2) - 2]) {
    cube([2, cable_diameter, 4]);
}

translate([0-(cable_diameter/4), 0-(cable_diameter*1.5), cable_diameter]) { 
    rotate([0, 90, 0]) {
        lug();
    }
}

module lug() {    
    difference() {
        union() {
            translate([0-(cable_diameter),0,0]){
                cube([cable_diameter*2, cable_diameter, cable_diameter/2]);
            }
            cylinder(h = cable_diameter/2, d = 2*cable_diameter);
        }
        cylinder(h = cable_diameter, d = cable_diameter);
    }
}