/**

Socket set box insert
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

x = 265;
y = 188;
z = 15; // Should be 28 - bottom half

socket_z1 = 5; // should be 15

spacing1 = 28;

difference() {

    // Box base
    cube([x, y, z]);

    // 2 x 4 sockets on right edge all the same size
    for(i = [0 : 1 : 3]) {
        translate([x - 20, y - 20 - (i * spacing1), socket_z1]) {
            socket(d = 22.5);
        }

        translate([x - 20 - spacing1, y - 20 - (i * spacing1), socket_z1]) {
            socket(d = 22.5);
        }
    }

    // Column 3 - same size as others
    translate([x - 20 - (2 * spacing1), y - 20, socket_z1]) {
        socket(d = 22.5);
    }

    // Column 3
    translate([x - 20 - (2 * spacing1), y - 20 - (1 * spacing1), socket_z1]) {
        socket(d = 24);
    }

    // Column 3
    translate([x - 20 - (2 * spacing1), y - 20 - (2 * spacing1), socket_z1]) {
        socket(d = 25);
    }

    // Column 3
    translate([x - 20 - (2 * spacing1), y - 20 - (3 * spacing1), socket_z1]) {
        socket(d = 26);
    }

    translate([31, y - 31, socket_z1]) {
        socket(d = 42);
    }

    translate([78, y - 26, socket_z1]) {
        socket(d = 33);
    }

    translate([119, y - 24, socket_z1]) {
        socket(d = 30);
    }

    translate([156, y - 23, socket_z1]) {
        socket(d = 28);
    }

    // 135mm extension
    translate([11, 123, z]) {
        extension(d1 = 16.75, l1 = 105, d2 = 24.5, l2 = 50);
    }

    // Universal joint
    translate([8, 84, z]) {
        extension(d1 = 27.5, l1 = 60, d2 = 17, l2 = 17);
    }

    // 60mm extension
    translate([90, 84, z]) {
        extension(d1 = 23.5, l1 = 25, d2 = 17, l2 = 55);
    }

    // Socket wrench
    translate([2, 46, z]) {
        wrench();
    }
}

module wrench() {
    // Wide end of handle
    translate([0, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = 96, d = 18, $fn=50);
        }
    }

    // Handle narrow middle
    translate([95, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = 105, d = 14, $fn=200);
        }
    }

    // Taper from handle to head
    translate([184, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = 12, d1 = 14, d2 = 20, $fn=200);
        }
    }

    // Smaller head body
    translate([211, 0, -10]) {
        cylinder(h = z, d = 37, $fn=50);
    }

    // Open the inclusion between the big and small head portions
    translate([222, 0, -10]) {
        cylinder(h = z, d = 42, $fn=50);
    }

    // Main head body
    translate([237, 0, -10]) {
        cylinder(h = z, d = 47, $fn=50);
    }

    // 1/2" square drive
    translate([235, 0, -30]) {
        cylinder(h = (2*z), d = 17, $fn=50);
    }
}

module extension(d1, d2, l1, l2) {
    // Top extension
    translate([0, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = l1+1, d = d1, $fn=50);
        }
    }

    translate([l1, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = l2, d = d2, $fn=50);
        }
    }
}

module socket(d) {
    cylinder(h=z, d = d, $fn=50);
}
