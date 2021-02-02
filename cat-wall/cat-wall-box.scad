/*

Cat climbing wall
@idnorton
2020-08-30

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build these your own cats :)

*/

// Overall size
x_size = 320;
y_size = 320;
thickness = 12;

hole = 190;
kerf = 2;

// Sides - left
side(x_size, y_size, thickness);

// Sides - right
difference() {
    translate([x_size - thickness, 0, 0]) { side(x_size, y_size, thickness); };
    translate([x_size - thickness, y_size/2, y_size/2]) {
       rotate(a=[0,90,0]) { cylinder(h = thickness * 3, d1 = hole, d2 = hole, center = true); }
    };    
}

// top & bottom
translate([0, 0, x_size-thickness]) {top_bottom(x_size, y_size, thickness);};
translate([0, 0, 0]) {top_bottom(x_size, y_size, thickness);};

// Front
difference() {
    translate([0, 0, 0]) {front_back(x_size, y_size, thickness);};
    translate([x_size/2, 0, y_size/2]) {
       rotate(a=[90,0,0]) { cylinder(h = thickness * 3, d1 = hole, d2 = hole, center = true); }
    };    
}

// Back
translate([0, x_size - thickness, 0]) {front_back(x_size, y_size, thickness);};

 module side (x, y, thickness) {
    cube(size = [thickness, y, x]);
 }
 
 module front_back (x, y, thickness) {
     translate([thickness + kerf, 0, 0]) {
         cube(size = [x - (2*thickness) - (2*kerf), thickness, y]);
     }
 }
 
 module top_bottom (x, y, thickness) {
     translate([thickness + kerf, thickness + kerf, 0]) {
         cube(size = [y - (2*thickness) - (2*kerf), x - (2*thickness) - (2*kerf), thickness]);
     }
 }