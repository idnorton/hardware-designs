/*
  
Cat step for banister gaps to prevent cats getting trapped in V shaped groove
@idnorton
2022-12-27

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial event

*/

difference() {
    // Width of step
    linear_extrude(
        height = 36,
        center = false,
        $fn = 100) {
            
            // Triangle wedge
            polygon(points = [
                [0, 0],
                [0, 30],
                [25.2, 0],
            ]);
    }

    // Ballustraid vertical
    translate([0,0,4]) {
        cube(size = [30,5,28], center = false);
    }
    
    // Screw through hole
    translate([0,18,18]) {
        rotate([0, 90, 0]) {
            cylinder(
                $fn=100,
                h=25,
                d=4,
                center=false
            );
        }
    }
    
    // Countersink for screw head
    translate([0,18,18]) {
        rotate([0, 90, 0]) {
            cylinder(
                $fn=100,
                h=4,
                d1=10,
                d2=0,
                center=false
            );
        }
    }    
}


    