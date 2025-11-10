


box_x = 420;
box_y = 298;

insert1_x = 345;
insert1_y = 15;

insert2_x = 210;
insert2_y = 7;

difference() {
    
    // Main body of the box
    square([box_x, box_y]);
    
    // Front wide lip
    translate([(box_x - insert1_x)/2, 0, 0]) { square([insert1_x, insert1_y]); }
    
    // Front inner lip
    translate([(box_x - insert2_x)/2, insert1_y, 0]) { square([insert2_x, insert2_y]); }
    
    // Top blips
    translate([42, box_y - 4, 0]) { top_blip(8); }
    translate([box_x/2, box_y - 4, 0]) { top_blip(8); }
    translate([box_x - 42, box_y - 4, 0]) { top_blip(8); }

    // Side blips left
    translate([0, 50, 0]) { side_blip(); }
    translate([0, 97, 0]) { side_blip_big(); }
    translate([0, 235, 0]) { side_blip(); }

    // Side blips right
    translate([box_x - 5, 50, 0]) { side_blip(); }
    translate([box_x - 26, 97, 0]) { side_blip_big(); }
    translate([box_x - 5, 235, 0]) { side_blip(); }

    // Corners?
    
}

module top_blip(d) {
    circle(d = d, $fn=50);
    translate([0, d/2, 0]) { square([d, d], center = true); }
}

module side_blip() {
    square([5, 20]);
}

module side_blip_big() {
    square([26, 100]);
}

