/**

Box for 8 way Modbus relay board
https://www.aliexpress.com/item/1005002356037000.html

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)



80 x 148

75mm fixings
142mm

Hole diameter 3mm

**/

box_x = 155;
box_y = 120;
box_z = 5;

pcb_x = 148;
pcb_y = 80;
pcb_z = 25;

wall = 1;

difference() {
    cube([box_x, box_y, box_z]);

    translate([wall, wall, wall]) {
        cube([
            (box_x - (2*wall)),
            (box_y - (2*wall)),
            box_z
        ]);
    }
    
    // Save time and filament by chopping a chunk out of the back
    translate([12, 5, 0]) {
        cube([box_x-(2*12), box_y-(2*5), 2*wall]);
    }
}

translate([(box_x - 143)/2, (box_y - 75) - 10, 0]){
    bosses(x = 143, y = 75);
}

module bosses(
    x = 0,
    y = 0,
) {
    // Bosses for PCB mounting
    translate([0, 0, 0]) { boss(); } // Bottom left
    translate([x, 0, 0]) { boss(); } // Bottom right
    translate([0, y, 0]) { boss(); } // Top left
    translate([x, y, 0]) { boss(); } // Top right
}

module boss() {
    boss_d1 = 5;
    boss_d2 = 3;

    cylinder(h = 7, d = 3, $fn = 50);
    cylinder(h = 5, d = 5, $fn = 50);
}
