/*
  
Banner mounting bracket for poles
@idnorton
2022-06-22

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own commercial event

*/

// Scaffold pole is 48.3mm or 2 inches

// Body dimensions
body_x = 50;
body_y = 100;
body_z = 15;

bolt_diameter = 6;
bolt_square = 9;
bolt_head = 17;

band_thickness = 6;

module body_bottom () {
  
  difference() {
    union () {
      // Big square body
      cube([body_x, body_y, body_z]);
    
      // Top triangle
      translate([body_x/2, 0, 32]) {
        rotate([270,45,0]) {
          cube([body_x/2, body_x/2, body_y]);
        }
      }
      
      
    }
    
    // V in the back
    translate([body_x/2, -1, 10]) {
      rotate([270, 45, 0]) {
        cube([body_x, body_x, body_y+2]);
      }
    }
    
    // Hole for bolt and recess for head
    translate([body_x/2, body_y*0.65, 0]) {
      cylinder(body_z + 100,d=bolt_diameter, $fn=100);
      cylinder(16, bolt_square/2, bolt_square/2, $fn=4);
      cylinder(12, bolt_head/2, bolt_head/2, $fn=100);
    }
  }

  // Below
  translate([0, 0, 0]) {
    band();
  }

  // Above
  translate([0, body_y + 20, 0]) {
    band();
  }
  
  translate([0, body_y +  35, 0]) {
    band();
  }
}

module bump (
    base = 15,
    height = 20,
    thickness = 20,
  ) {
  difference () {
    union () {
      // Base body
      cube([body_x, thickness, base]);

      // Round top
      translate([body_x/2,0,height]) {
        rotate([270,0,0]) {
          cylinder(thickness,d=body_x, $fn=100);
        }
      }
    }
  
    // V in the back
    translate([body_x/2, -1, 10]) {
      rotate([270, 45, 0]) {
        cube([body_x, body_x, body_y+2]);
      }
    }
    
    // Flatten the bottom
    translate([0,0,-20]) {
      cube([body_x, body_y, 20]);
    }
  }  
}

module band () {
  translate([0, -5, 0]) {
    bump(base = 20, thickness = 5);
  }
  translate([0, -15, 0]) {
    bump(height = 15, thickness = 10);
  }
  translate([0, -20, 0]) {
    bump(base = 20, thickness = 5);
  }
}

body_bottom();
