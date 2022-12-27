/**

Can storage design for lasering
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

storage_x = 300;
storage_y = 280;

dowel_diameter = 25;
dowel_inset = 30;

ramp_thickness = 6;

difference() {    
    // Main body
    rounded_square([storage_x, storage_y], r=dowel_diameter);
    
    // Dowels in the corners
    translate([dowel_inset, dowel_inset]) { circle(d=dowel_diameter, $fn=50); }
    translate([storage_x - dowel_inset, dowel_inset]) { circle(d=dowel_diameter, $fn=50); }
    translate([dowel_inset, storage_y - dowel_inset]) { circle(d=dowel_diameter, $fn=50); }
    translate([storage_x - dowel_inset, storage_y - dowel_inset]) { circle(d=dowel_diameter, $fn=50); }

    // Bottom ramp
    translate([50, 10]) {
        polygon([
            [0,0],
            [storage_x - 100, 35],
            [storage_x - 100, 35 + ramp_thickness],
            [0, ramp_thickness]],
            paths=[[0,1,2,3]]
        );
    }

    // Top ramp
    translate([20, 130]) {
        polygon([
            [0,25],
            [storage_x - 130, 0],
            [storage_x - 130, ramp_thickness],
            [0, 25 + ramp_thickness]],
            paths=[[0,1,2,3]]
        );
    }
    
    // Vertical ramp
    translate([storage_x - 45, 55]) {
        polygon([
            [0,0],
            [ramp_thickness, 0],
            [30, storage_y - 110],
            [30 - ramp_thickness, storage_y - 110]],
            paths=[[0,1,2,3]]
        );
    }


        
}

module rounded_square(s, r=10) {
  translate([r, r])
  minkowski() {
    square([s[0]-(2*r), s[1]-(2*r)]);
    circle(r=r, $fn=50);
  }
}

