/*
  
Lincat EB3F gasket
@idnorton
2022-06-22

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial event

*/

difference() {
    // Outer square
    square(size = [242, 170], center = false);
    
    // Inner cutout
    translate([18,18,0]) {
        square(size = [206, 134], center = false);
    }
    
    // Bottom left hole
    translate([40,9,0]) {
        circle(d=6, $fn=100);
    }
    
    // Bottom right
    translate([40+162,9,0]) {
        circle(d=6, $fn=100);
    }
    
    // Top left hole
    translate([40,161,0]) {
        circle(d=6, $fn=100);
    }
    
    // Top right
    translate([40+162,161,0]) {
        circle(d=6, $fn=100);
    }
    
}