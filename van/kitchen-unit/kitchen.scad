$fn = 100;

include <AluminumExtrusionProfile.scad>

height = 890;

// Front bar on floor
translate([0, 15, 15])
  rotate([0,90,0])
    linear_extrude(1670)
      3030_extrusion_profile(slot = "t");

// Back bar on floor
translate([0, 445, 15])
  rotate([0,90,0])
    linear_extrude(1670)
      3030_extrusion_profile(slot = "t");

// Front bar top
translate([0, 15, 45 + height])
  rotate([0,90,0])
    linear_extrude(1670)
      3030_extrusion_profile(slot = "t");

// Back bar top
translate([0, 445, 45 + height])
  rotate([0,90,0])
    linear_extrude(1670)
      3030_extrusion_profile(slot = "t");

column1 = 15;
column2 = 350;
column3 = 685;
column4 = 1020;
column5 = 1655;

// Column 1 back to front on floor
translate([column1, 30, 15])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 1 front vertical
translate([column1, 30, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 1 back vertical
translate([column1, 430, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 1 back to front on top
translate([column1, 30, 45 + height])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 2 back to front on floor
translate([column2, 30, 15])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 2 front vertical
translate([column2, 30, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 2 back vertical
translate([column2, 430, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 2 back to front on top
translate([column2, 30, 45 + height])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 3 back to front on floor
translate([column3, 30, 15])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 3 front vertical
translate([column3, 30, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 3 back vertical
translate([column3, 430, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 3 back to front on top
translate([column3, 30, 45 + height])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 4 back to front on floor
translate([column4, 30, 15])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 4 front vertical
translate([column4, 30, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 4 back vertical
translate([column4, 430, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 4 back to front on top
translate([column4, 30, 45 + height])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Test length for checking spacing
//translate([1035, 445, -15])
//  rotate([0,90,0])
//    linear_extrude(605)
//      3030_extrusion_profile(slot = "t");

// Column 5 back to front on floor
translate([column5, 30, 15])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");

// Column 5 front vertical
translate([column5, 30, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 5 back vertical
translate([column5, 430, 30])
  rotate([0,0,90])
    linear_extrude(height)
      3060_extrusion_profile(slot = "t");

// Column 5 back to front on top
translate([column5, 30, 45 + height])
  rotate([270,0,0])
    linear_extrude(400)
      3030_extrusion_profile(slot = "t");
