/**

Brackets for Teyes reversing camera
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Perimiters: 4

**/

camera_x = 22;
camera_y = 22;
camera_z = 5;

cable = 4;
screw_camera = 3;
screw_mount = 4;
screw_pivot = 5;
screw_spacing_camera = 13;

heat_set_insert = 4;
external_wall = 1;
external_x = camera_x + (2 * heat_set_insert);
external_y = camera_y + (2 * external_wall);
external_z = 15;

screw_x_inset = (camera_x - screw_spacing_camera)/2;

screw_x = (external_x - screw_spacing_camera)/2;
screw_y = (external_y - (2 * external_wall) - screw_x_inset);

$fn = 100;

difference() {

    // External cube
    cube([external_x, external_y, external_z]);

    // Internal cube
    translate([((external_x - camera_x) / 2), external_wall, camera_z]) {
        cube([camera_x, camera_y, external_z]);
    }

    // Mounting holes through the sides
    translate([-1, external_y/2, (camera_z+external_z)/2]) {
        rotate([0, 90, 0]) cylinder(h = external_x + external_wall, d = screw_pivot);
    }

    // Camera mounting hole left
    translate([screw_x, screw_y, 0]) {
        cylinder(h = external_z, d = screw_camera);
    }

    // Camera mounting hole right
    translate([external_x - screw_x, screw_y, 0]) {
        cylinder(h = external_z, d = screw_camera);
    }

    // Recess for camera bosses
    translate([((external_x - camera_x) / 2), (camera_y/2) + external_wall, 2.5]) {
        cube([camera_x, camera_y/2, 4]);
    }

    // Cable slot
    translate([external_x/2, external_y/2, 0]) cylinder(h = camera_z, d = cable);
    translate([external_x/2 - (cable/2), external_y/2, 0]) cube([cable, external_y, external_z]);
}
