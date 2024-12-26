/*
  
Bed repair brackets for Alex
@idnorton
2024-12-26

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial event

*/

bedpost = 52;
plate_x = 25;
plate_y = 105;
plate_z = 35;
hole = 8;
spacing = 75;

difference() {
    
  // Cuboid
  cube([plate_x, plate_y, plate_z]);
    
  translate([plate_x/2, 0, plate_z]) {
    rotate([270, 0, 0]) {  
      cylinder(h = plate_y, d = bedpost, $fn = 100);
    }
  }
  
  // Offset from bottom and top
  offset = (plate_y - spacing)/2;
  
  translate([plate_x/2, offset, 0]) {
    cylinder(h = plate_z, d = hole, $fn = 50);
  }

  translate([plate_x/2, plate_y - offset, 0]) {
    cylinder(h = plate_z, d = hole, $fn = 50);
  }  
}