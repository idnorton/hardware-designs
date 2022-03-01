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
d2 = 120;
wall = 2;
height = 10;

mounting_bolt = 6;
mounting_boss = 30;
mounting_hole_offset = 100;


// Insert part
difference() {

  // Main body of this section
  cylinder (h = 2, d=d1, center = true, $fn=100);

  // Left inclusion
  translate([-mounting_hole_offset/2, 0, 0]) { cylinder (h = 2, d=mounting_boss, center = true, $fn=100); }
  translate([-mounting_hole_offset/2-(mounting_boss/2), 0, 0]) {
      cube([mounting_boss, mounting_boss, 2], center = true, $fn=100);
  }
  
  // Right inclusion
  translate([mounting_hole_offset/2, 0, 0]) { cylinder (h = 2, d=mounting_boss, center = true, $fn=100); }
  translate([mounting_hole_offset/2+(mounting_boss/2), 0, 0]) {
      cube([mounting_boss, mounting_boss, 2], center = true, $fn=100);
  }
}

// Outside lip
difference() {
  
  // Main body of this section
  cylinder (h = 2, d=d2, center = true, $fn=100);

  // Left bolt hole
  translate([-mounting_hole_offset/2, 0, 0]) { cylinder (h = 2, d=mounting_bolt, center = true, $fn=100); }

  // Right bolt hole
  translate([mounting_hole_offset/2, 0, 0]) { cylinder (h = 2, d=mounting_bolt, center = true, $fn=100); }  
}