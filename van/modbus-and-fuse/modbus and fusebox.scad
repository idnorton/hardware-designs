/**

Mounting for 6 way 12v fuse box and 8 way modbus board
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

cable_border = 30;

fuse_x = 85;
fuse_y = 87;

modbus_x = 148;
modbus_y = 80;

wall_thickness = 2;
wall_x = fuse_x + modbus_x + (3 * cable_border) + (2 * wall_thickness);
wall_y = max(fuse_y, modbus_y) + (2 * cable_border) + (2 * wall_thickness);
wall_z = 35;

difference() {
    
    // Exterior body
    cube([wall_x, wall_y, wall_z]);
    
    // Hollow out the main body
    translate([
      wall_thickness,
      wall_thickness,
      wall_thickness
    ]) {
      cube([
        wall_x - (2 * wall_thickness),
        wall_y - (2 * wall_thickness),
        wall_z - wall_thickness]);  
    }
    
    // Fuse box outline and mounting holes
    translate([
        wall_thickness + cable_border,
        wall_thickness + cable_border,
        wall_thickness - 1
    ]) {
        fusebox();
    }
    
    // Modbus mounting holes
    translate([
        wall_thickness + (2 * cable_border) + fuse_x,
        wall_thickness + cable_border,
        wall_thickness - 1
    ]) {
        modbus();
    }
    
    // Cable cutouts above
    translate([wall_thickness + cable_border, wall_y - cable_border, 0]) {
        cube([fuse_x, cable_border - 4, (wall_thickness * 2)]);
    }

    translate([wall_thickness + (2 * cable_border) + fuse_x, wall_y - cable_border, 0]) {
        cube([modbus_x, cable_border - 4, (wall_thickness * 2)]);
    }

    // Cable cutouts below
    translate([wall_thickness + cable_border, wall_thickness + 2, 0]) {
        cube([fuse_x, cable_border - 4, (wall_thickness * 2)]);
    }

    translate([wall_thickness + (2 * cable_border) + fuse_x, wall_thickness + 2, 0]) {
        cube([modbus_x, cable_border - 4, (wall_thickness * 2)]);
    }    
}

module fusebox() {
    // Fuse box outline
    cube([fuse_x, fuse_y, wall_thickness]);

    // Mounting holes
    translate([7, 7, 0]) { hole(d=4); }
    translate([fuse_x - 7, 7, 0]) { hole(d=4); }
    translate([7, fuse_y - 7, 0]) { hole(d=4); }
    translate([fuse_x - 7, fuse_y - 7, 0]) { hole(d=4); }
}

module hole(d = 4) {
    cylinder(h = (wall_thickness * 2), d = d, center = true, $fn=50);
}

module modbus() {
    // PCB outline
    cube([modbus_x, modbus_y, wall_thickness]);
    
    // Mounting holes    
    translate([3, 3, 0]) { hole(d=3); } // Bottom left
    translate([modbus_x - 3, 3, 0]) { hole(d=3); } // Bottom right
    translate([3, modbus_y - 3, 0]) { hole(d=3); } // Top left
    translate([modbus_x - 3, modbus_y - 3, 0]) { hole(d=3); } // Top right  
}