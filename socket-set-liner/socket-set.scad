/**

Socket set box insert
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

x = 263;
y = 185;
z = 28; // Should be 28 - bottom half

socket_z1 = 5;

spacing1 = 28;

difference() {

    // Box base
    cube([x, y, z]);

    // 2 x 4 sockets on right edge all the same size
    for(i = [0 : 1 : 3]) {
        translate([x - 18, y - 18 - (i * spacing1), socket_z1]) {
            socket(d = 22.5);
        }

        translate([x - 18 - spacing1, y - 18 - (i * spacing1), socket_z1]) {
            socket(d = 22.5);
        }
    }

    // Column 3 - same size as others
    translate([x - 18 - (2 * spacing1), y - 18, socket_z1]) {
        socket(d = 22.5);
    }

    // Column 3
    translate([x - 18 - (2 * spacing1), y - 18 - (1 * spacing1), socket_z1]) {
        socket(d = 24);
    }

    // Column 3
    translate([x - 18 - (2 * spacing1), y - 18 - (2 * spacing1), socket_z1]) {
        socket(d = 25);
    }

    // Column 3
    translate([x - 18 - (2 * spacing1), y - 18 - (3 * spacing1), socket_z1]) {
        socket(d = 26);
    }

    // 32mm
    translate([31, y - 27, socket_z1]) {
        socket(d = 42);
    }

    // 24mm
    translate([78, y - 23, socket_z1]) {
        socket(d = 33);
    }

    // 22mm
    translate([119, y - 22, socket_z1]) {
        socket(d = 30);
    }

    // 21mm
    translate([156, y - 21, socket_z1]) {
        socket(d = 28);
    }

    // Square adapter
    translate([156, 134, socket_z1]) {
        socket(d = 24);
    }

    // 135mm extension
    translate([166, 105, z]) {
      rotate([0, 180, 0]) {
        extension(d1 = 24.5, l1 = 42, d2 = 16.75, l2 = 113);
      }
    }

    // Universal joint
    translate([8, 76, z]) {
        extension(d1 = 27.5, l1 = 59, d2 = 16, l2 = 17);
    }

    // 80mm extension
    translate([90, 76, z]) {
        extension(d1 = 23.5, l1 = 22, d2 = 17, l2 = 58);
    }

    // Socket wrench
    translate([2, 48, z]) {
        wrench();
    }

    // 250mm extension
    translate([6, 15, z]) {
        extension(d1 = 23, l1 = 25, d2 = 17, l2 = 225);
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
    translate([185, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = 12, d1 = 14, d2 = 20, $fn=200);
        }
    }

    // Smaller head body
    translate([211, 0, -10]) {
        cylinder(h = z, d = 34, $fn=50);
    }

    // Open the inclusion between the big and small head portions
    translate([222, 0, -10]) {
        cylinder(h = z, d = 41, $fn=50);
    }

    // Main head body
    translate([237, 0, -10]) {
        cylinder(h = z, d = 44, $fn=50);
    }

    // 1/2" square drive
    translate([234, 0, -30]) {
        cylinder(h = (2*z), d = 20, $fn=50);
    }
}

module extension(d1, d2, l1, l2) {
    // Top extension
    translate([0, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = l1, d = d1, $fn=50);
        }
    }

    translate([l1, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = l2, d = d2, $fn=50);
        }
    }

    // Chamfer between the two parts
    translate([l1, 0, 0]) {
        rotate([0, 90, 0]) {
            cylinder(h = 10, d1 = d1, d2 = d2, $fn=50);
        }
    }
}

module socket(d) {
    tolerance = 1; // Tolerance for printing shrinkage
    cylinder(h=z, d = d + tolerance, $fn=50);
}
