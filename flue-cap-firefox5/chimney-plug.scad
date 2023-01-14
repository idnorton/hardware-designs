/*

3d printed flue plug for Firefox 5 woodburning/multifuel stove
@idnorton
2022-02-21

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design for your own commercial environment :)

*/

d1 = 115;
d2 = 130;
wall = 4;
height = 10;

mounting_bolt = 7;
mounting_boss = 30;
mounting_hole_offset = 100;

module insert(diameter, thickness, boss, offset) {
    // Insert part
    difference() {
        // Main body of this section
        cylinder (h=thickness, d=diameter, center = true, $fn=100);
        inclusions(thickness = thickness, boss = boss, offset = offset);
    }
}

module inclusions(thickness, boss, offset) {
    // Left inclusion
    translate([-offset/2, 0, 0]) { cylinder (h = thickness, d=boss, center = true, $fn=100); }
    translate([-offset/2-(boss/2), 0, 0]) {
        cube([boss, boss, thickness], center = true, $fn=100);
    }

    // Right inclusion
    translate([offset/2, 0, 0]) { cylinder (h = thickness, d=boss, center = true, $fn=100); }
    translate([offset/2+(boss/2), 0, 0]) {
        cube([boss, boss, thickness], center = true, $fn=100);
    }
}


// Insert part
translate([0,0,(height/2)+1]) {
    difference() {
        insert(d1, height, mounting_boss, mounting_hole_offset);
        insert(d1-wall, height, mounting_boss + wall, mounting_hole_offset);
    }
}

// Skirt
translate([0,0,(height/2)+1]) {
    difference() {
        cylinder(h=2, d=d2, center = true, $fn=100);
        insert(d1, height, mounting_boss, mounting_hole_offset);
        inclusions(wall, mounting_boss, mounting_hole_offset);
    }
}

// Closed end
difference() {

  // Main body of this section
  cylinder (h = 2, d=d1, center = true, $fn=100);

  // Left bolt hole
  translate([-mounting_hole_offset/2, 0, 0]) { cylinder (h = 2, d=mounting_bolt, center = true, $fn=100); }

  // Right bolt hole
  translate([mounting_hole_offset/2, 0, 0]) { cylinder (h = 2, d=mounting_bolt, center = true, $fn=100); }
}
