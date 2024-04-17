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

wall = 2;

difference() {
    cube([box_x, box_y, box_z]);
    
    translate([wall, wall, wall]) {
        cube([
            (box_x - (2*wall)),
            (box_y - (2*wall)),
            box_z
        ]);
    }
}

boss_x1 = ((box_x - (2*wall) - pcb_x)/2) + 5;
boss_x2 = boss_x1 + 142;
boss_y1 = ((box_y - (2*wall) - pcb_y)/2) + 5;
boss_y2 = boss_y1 + 75;

// Bosses for PCB mounting
translate([boss_x1, boss_y1, (2*wall)]) { boss(); }
translate([boss_x2, boss_y1, (2*wall)]) { boss(); }
translate([boss_x1, boss_y2, (2*wall)]) { boss(); }
translate([boss_x2, boss_y2, (2*wall)]) { boss(); }


module boss() {
    boss_d1 = 5;
    boss_d2 = 3;
    
    cylinder(h = 10, d = 3, center = true, $fn = 50);
    cylinder(h = 5, d = 5, center = true, $fn = 50);    
}



