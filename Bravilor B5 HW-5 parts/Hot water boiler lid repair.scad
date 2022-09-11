/*
  
Bravilor B5 HW-5 hot water tank lid repair
@idnorton
2022-09-11

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use

*/

d = 145;
h = 13.4;



//difference() {
    //union () {
        //cube([body_x, body_y, body_z]);

        // Top triangle
        //translate([body_x/2, 0, 32]) {
            //rotate([270,45,0]) {
                //cube([body_x/2, body_x/2, body_y]);
            //}
        //}
    //}
    

union () {        
    difference () {
        intersection () {
            // Sticking out lump
            translate([0, 0, 5]) {
                cylinder(2.5, d=d+2.5, $fn=100);
            }
            
            // Cube intersection
            translate([-15, 0, 0]) {
                cube([30, 90, h]);
            }
        }
        
        // Remove the center of the 
        translate([0, 0, 5]) {
            cylinder(2.5, d=d, $fn=100);
        }
    }

    intersection () {
        // Cube intersection
        translate([-15, 0, 0]) {
            cube([30, 90, h]);
        }

        // Match existing rim
        difference () {
            cylinder(h,d=d, $fn=100);
            cylinder(h,d=d-2, $fn=100);
        }
    }

    // Match existing rim
    difference () {
        cylinder(h,d=d-2, $fn=100);
        cylinder(h,d=d-4, $fn=100);
    }
}