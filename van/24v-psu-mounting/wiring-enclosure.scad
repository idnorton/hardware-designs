/**

PSU mounting and wiring cover
Meanwell LRS-200-24
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

x = 115;
y = 90;
z = 30;
thickness = 3;
screws = 3;

iec_x = 28;
iec_y = thickness;
iec_z = 20;

difference() {
    // Outside box body
    cube([x+(2*thickness), y+(2*thickness), z+(2*thickness)]);

    // PSU body
    translate([thickness, thickness, thickness]) {
        cube([x, y*2, z]);
    }
    
    // Vent
    translate([6, 70, z]) {
        cube([x-6, 40, z]);
    }
    
    // Screw #1
    translate([32.5 + thickness, 80, 0]) {
        bottom_screw(2*thickness);
    }
    
    // Screw #2
    translate([x+(2*thickness) - (32.5 + thickness), 80, 0]) {
        bottom_screw(2*thickness);
    }

    // IEC cutout
    translate([80, 0, ((z+(2*thickness)-iec_z)/2)]) {
        iec_cutout();
    }
    
    // 24v fuse holder
    translate([0, (z+(2*thickness))/2, (z+(2*thickness))/2]) {
        rotate([0, 90, 0]) {
            cylinder(h=thickness*2, d=12.5, center=true, $fn=50);
        }
    }
    
    // Anderson connector
    anderson();
}

module anderson() {
    // 
}


module iec_cutout() {
    // IEC socket
    cube([28, thickness, 20]);
    
    iec_screws = 40;
    screw_offset = (iec_screws - iec_x)/2;
    
    // Screw #1
    translate([-screw_offset, 0, iec_z/2]) {
        front_screw(2*thickness);
    }
    
    // Screw #2
    translate([(iec_screws - screw_offset), 0, iec_z/2]) {
        front_screw(2*thickness);
    }
}


module bottom_screw(h) {
    rotate([0, 0, 0]) {
        cylinder(h=h, d=screws, center=true, $fn=50);
    }
}

module front_screw(h) {
    rotate([90, 0, 0]) {
        cylinder(h=h, d=screws, center=true, $fn=50);
    }
}