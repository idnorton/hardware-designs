/**

PSU mounting and wiring cover
Meanwell LRS-200-24
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

use <Parametric_PowerPole_Breakout_cascade_remix.scad>;

x = 115;
y = 90;
z = 30;
thickness = 3;
screws = 3;

iec_x = 28;
iec_y = thickness;
iec_z = 20;

$fn=60; // How smooth are circles?


difference() {
    // Outside box body
    cube([x+(2*thickness), y+(2*thickness), z+(2*thickness)]);

    // PSU body
    translate([thickness, thickness*2, thickness]) {
        cube([x, y*2, z]);
    }
    
    // Vent
    translate([thickness, y-18, 0]) {
        cube([x, 40, z+(2*thickness)]);
    }

    // Gap for mounting bracket
    translate([0, y-18, 0]) {
        cube([x + (2*thickness), 40, thickness+1]);
    }

    
    // Screws on both lugs
    translate([(x/2)+thickness, y - 5, 13+thickness]) {
        side_screw(d = 4.5, h = x+(2*thickness));
    }
    
    // IEC cutout
    translate([80, 0, ((z+(2*thickness)-iec_z)/2)]) {
        iec_cutout();
    }

    // Fuse
    translate([20, 0, 18]) {
        fuse_holder();
    }
    
    // Gap to put the anderson power pole in
    translate([54, 10, (z/2)+thickness]) { union() { cube([24, 20, 20], center = true); }}   
}

difference() {
    // Cube to host anderson connector
    translate([54, 10, (z/2)+thickness]) { union() { cube([24, 20, 20], center = true); }}

    // Anderson connector
    translate([54, 12, (z/2)+thickness]) {
        anderson();
    }
}

// Mounting lugs x 2


module anderson() {
    // https://www.printables.com/model/467932-anderson-powerpole-chassis-socket-panel
    //cube([13.5, 4*thickness, 21.5], center = true);
    
    //translate([-9, 0, -13]) {
    //    front_screw(d = 3.5);
    //}

    //translate([9, 0, -13]) {
    //    front_screw(d = 3.5);
    //}

    //translate([-9, 0, 13]) {
    //    front_screw(d = 3.5);
    //}
    
    //translate([9, 0, 13]) {
    //    front_screw(d = 3.5);
    //}
    
    
    rotate([0,180,90]) {
        powerPoleShell(centerPin=false, outerPins=false);
        translate([2.5,-7.9,-10]) cylinder(r=1.01,h=80); // 20140408
        translate([2.5,7.9,-10]) cylinder(r=1.01,h=80); // 20140408
    }
    
}

module fuse_holder() {
    // https://uk.farnell.com/multicomp-pro/mp001008/automotive-blade-fuse-holder-1p/dp/3227159
    
    spacing = 27.5;
    
    cube([21.5, 4*thickness, 7], center = true);
    
    // Screw #1
    translate([spacing/2, 0, 0]) {
        front_screw(d = 3.5);
    }
    
    // Screw #2
    translate([-(spacing/2), 0, 0]) {
        front_screw(d = 3.5);
    }
}

module iec_cutout() {
    // IEC socket
    cube([28, thickness*4, 20]);
    
    iec_screws = 40;
    screw_offset = (iec_screws - iec_x)/2;
    
    // Screw #1
    translate([-screw_offset, 0, iec_z/2]) {
        front_screw(h=4*thickness);
    }
    
    // Screw #2
    translate([(iec_screws - screw_offset), 0, iec_z/2]) {
        front_screw(h=4*thickness);
    }
}


module bottom_screw(h) {
    rotate([0, 0, 0]) {
        cylinder(h=h, d=screws, center=true, $fn=50);
    }
}

module front_screw(d=4, h=4*thickness) {
    rotate([90, 0, 0]) {
        cylinder(h=h, d=d, center=true, $fn=50);
    }
}

module side_screw(d=4, h=4*thickness) {
    rotate([0, 90, 0]) {
        cylinder(h=h, d=d, center=true, $fn=50);
    }
}