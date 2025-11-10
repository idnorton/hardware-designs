/**

Spacer for electrical backbox

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

x = 137;
y = 76;
z = 6;
r = 10;

hole_x = 16;
hole_y = 13.5;
holes = 6;

difference() {
    rounded_cube([x, y, z], r=10);
    
    translate([hole_x, hole_y, 0]) { hole(); }
    translate([x-hole_x, y-hole_y, 0]) { hole(); }
    
    indent = 25.5;
    
    // Holes on the y axis centre line
    translate([indent, y/2, 0]) { hole(); }
    translate([x - indent, y/2, 0]) { hole(); }    
}

module hole() {
    cylinder(h=z, d=holes, $fn=100);
}

module rounded_cube(s, r=10) {
  translate([r, r])
  minkowski() {
    cube([s[0]-(2*r), s[1]-(2*r), s[2]/2]);
    cylinder(r=r, h=(s[2]/2), $fn=100);
  }
}