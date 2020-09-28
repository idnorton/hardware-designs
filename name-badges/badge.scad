/**

Name badges for LGBT+ communities
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

**/

badge_x = 104;
badge_y = 102;

band_head = 20;
band_foot = 12;

flag_size = badge_x - band_head - band_foot;

// Top down
band_1_size = flag_size * 0.4;
band_2_size = flag_size * 0.2;
band_3_size = flag_size * 0.4;

// Top down
line_1_y = badge_x - band_head;
line_2_y = band_foot + band_1_size + band_2_size;
line_3_y = band_foot + band_1_size;

flag_bottom_y = band_foot;

flag_middle_size = flag_size * 0.2;
flag_middle_y = band_foot + flag_bottom_size;

flag_top_size = flag_size * 0.4;
flag_top_y = band_foot + flag_bottom_size + flag_middle_size;

module name_badge(
    name,
    size
) {
    difference() {    
        // Main body
        rounded_square([104,102], r=12);
        
        // Holes for lanyard
        translate([badge_x * 0.2, badge_y-9]) { circle(d=5, $fn=50); }
        translate([badge_x * 0.5, badge_y-9]) { circle(d=5, $fn=50); }
        translate([badge_x * 0.8, badge_y-9]) { circle(d=5, $fn=50); }
        
        // Line 1
        translate([0, line_1_y]) { square([badge_x, 1]); }        
        
        // Line 2
        translate([0, line_2_y]) { square([badge_x, 1]); }
    
        // Line 3
        translate([0, line_3_y]) { square([badge_x, 1]); }

        // Line 4
        translate([0, flag_bottom_y]) { square([badge_x, 1]); }
        
        // Name
        translate([badge_x/2, badge_y/2, 0]) {
            text(
                name,
                size = size,
                halign = "center",
                valign = "center",
                font="Liberation Sans:style=Bold"
            );
        }

    }  
}

module rounded_square(s, r=10) {
  translate([r, r])
  minkowski() {
    square([s[0]-(2*r), s[1]-(2*r)]);
    circle(r=r, $fn=50);
  }
}

// Testing this module
name_badge( name = "Ian", size = 34 );