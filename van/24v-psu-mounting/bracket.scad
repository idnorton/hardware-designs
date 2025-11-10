/**

PSU mounting bracket - print two of these per PSU
Meanwell LRS-200-24
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Print settings: 0.20mm SPEED
Supports: None
Infill: 20%
Perimiters: 3

**/

hole = 4.5;
bolt_head_d = hole * 2;
bolt_head_z = 3;
hole_x = 50;
hole_y = 150;

frame = 20;

x = 115 + (frame * 2);
y = 215;
z = 3.5;

inset = (x - hole_x) / 2;

difference() {
    cube([x, frame, 5]);
        
    translate([(x/2) - (hole_x/2), frame/2, 0]) {
        cylinder(h = 5, d = hole, $fn = 50);
        cylinder(h = bolt_head_z, d = bolt_head_d, $fn = 50);
    }
    
    translate([(x/2) + (hole_x/2), frame/2, 0]) {
        cylinder(h = 5, d = hole, $fn = 50);
        cylinder(h = bolt_head_z, d = bolt_head_d, $fn = 50);        
    }
    
    translate([frame/2, frame/2, 0]) {
        cylinder(h = 5, d = hole, $fn = 50);
    }

    translate([x - (frame/2), frame/2, 0]) {
        cylinder(h = 5, d = hole, $fn = 50);
    }
}