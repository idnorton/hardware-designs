/*

Vacuum hose adapter

@idnorton
2023-04-04

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial use

*/

// Outside diameter
d1 = 39.2;

// Inside diameter
d2 = 32;

difference() {
    // Outer body
    cylinder(h=55, d1=d1, d2=d1-0.2, $fn=200);

    // End to end narrowest bore
    cylinder(h=55, d1=d2-2, d2=d2-2, $fn=200);

    translate([0, 0, 15]) {
        // Narrow inner lip for 
        cylinder(h=40, d1=d2-0.2, d2=d2, $fn=200);
    }
}