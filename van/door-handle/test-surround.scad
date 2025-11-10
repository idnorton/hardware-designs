/*

Test surround for Camloc 400
@idnorton
2023-08-17

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial event

*/

lock_x = 88;
lock_y = 54;
lock_z = 5;

//lock_x_border = (110 - lock_x) / 2;
//lock_y_border = (80 - lock_y) / 2;

lock_x_border = (220 - lock_x) / 2;
lock_y_border = (250 - lock_y) / 2;

tab_x = 5;
tab_y = 2;

difference() {
    // Outside border
    cube([lock_x + (lock_x_border*2), lock_y + (lock_y_border * 2), lock_z], center = false);

    // Main body of lock
    translate([lock_x_border, lock_y_border, 0]) {
        cube([lock_x, lock_y, lock_z], center = false);
    }

    // Tabs vertical left most
    translate([lock_x_border + 2, lock_y_border - tab_y, 0]) {
        cube([tab_x, lock_y + (2*tab_y), lock_z], center = false);
    }

    // Tabs vertical left center
    translate([lock_x_border + 26, lock_y_border - tab_y, 0]) {
        cube([tab_x, lock_y + (2*tab_y), lock_z], center = false);
    }

    // Tabs vertical right center
    translate([lock_x_border + 58, lock_y_border - tab_y, 0]) {
        cube([tab_x, lock_y + (2*tab_y), lock_z], center = false);
    }

    // Tabs vertical right most
    translate([lock_x_border + 80, lock_y_border - tab_y, 0]) {
        cube([tab_x, lock_y + (2*tab_y), lock_z], center = false);
    }
}
