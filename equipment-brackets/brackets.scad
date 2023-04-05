/*

Generic equipment mounting brackets
@idnorton
2023-02-15

Usage:

  lip       - Size of the lip used to hold the device (default 12mm)
  screw     - Diameter of screw hole fixings (default 4.5mm)
  thickness - Thickness of the bracket (default 4mm)
  x         - X Dimension of device fitting in bracket
  y         - Y Dimension of device fitting in bracket

Example command line usage:

  openscad -D x=125 -D y=45 -D screw=4.5 brackets.scad -o allied-telesis-g900.stl

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial environment

*/

// Default values for CLI params
x = 0;
y = 0;
screw = 4.5;
lip = 12;
thickness = 4;

module bracket(
  x,
  y,
  thickness = thickness,
  lip = lip,
  screw = screw,
  x_offset = 0,
  ) {
    
  difference() {
    union() {
      // Outer shell
      cube(size = [x + (2*thickness),y + (2*thickness), lip], center = false);
  
      // lip for screws
      cube(size = [x + (2*thickness),thickness, (lip*2)], center = false);
    }
    
    // Remove body of device
    translate([x_offset, thickness, thickness]) {
      cube(size = [x+thickness,y,lip-thickness], center = false);
    }

    // Remove side of body for ventilation
    translate([lip, lip, 0]) {
      cube(size = [x+(2*thickness)-(2*lip),y+(2*thickness)-(2*lip),thickness], center = false);
    }
    

    // Bottom screw
    rotate([90,0,0]) {
      translate([2*lip, lip*1.25, -thickness]) {
        screw(d = screw);
      }
    }

    // Top screw
    rotate([90,0,0]) {
      translate([x-(2*lip), lip*1.25, -thickness]) {
        screw(d = screw);
      }
    }    
  }  
}

module screw(d = 4.5) {
  // Screw through hole
  cylinder(
    $fn=100,
    h=10*2,
    d=d,
    center=false
  );

  // Countersink for screw head
  cylinder(
    $fn=100,
    h=d,
    d1=10,
    d2=0,
    center=false
  );
}

// Right hand bracket
bracket(
  x = x,
  y = y,
  lip = lip
);

// Left hand bracket
translate([0, y + lip, 0]) {
  bracket(
    x = x,
    y = y,
    lip = lip,
    x_offset = 4
  );
}
