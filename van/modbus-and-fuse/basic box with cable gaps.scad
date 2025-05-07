/**

Generic enclosure for van stuff
@idnorton

Licenced as Creative Commons Attribution Non Commercial 3.0
See https://creativecommons.org/licenses/by-nc/3.0/

Specifically you may not sell the design or products using the design.
You're welcome to use the design to build things for your own use :)

Print settings: 0.20mm SPEED
Supports: None
Infill: 20%
Perimiters: 3

**/

wall_thickness = 2;
wall_x = 210; // This needs to be an arg
wall_y = 150;
wall_z = 20;

gaps = 45;
corner = 20;
insert = 2;
support = 5;



difference() {
    // Exterior body
    cube([wall_x, wall_y, wall_z]);
    
    // Hollow out the main body
    translate([
      wall_thickness,
      wall_thickness,
      wall_thickness
    ]) {
      cube([
        wall_x - (2 * wall_thickness),
        wall_y - (2 * wall_thickness),
        wall_z - wall_thickness]);  
    }

    // Left side bottom gap
    translate([0, corner, 0]) {
        vgap();
    }

    // Left side top gap
    translate([0, wall_y - gaps - corner, 0]) {
        vgap();
    }
    
    // Right side bottom gap
    translate([
        wall_x - insert - wall_thickness,
        corner,
        0
    ]) {
        vgap();
    }
    
    // Right side top gap
    translate([
        wall_x - insert - wall_thickness,
        wall_y - gaps - corner,
        0
    ]) {
        vgap();
    }
    
    // Top side left gap
    translate([
        corner,
        wall_y - insert - wall_thickness,
        0
    ]) {
        hgap();
    }
    
    // Top side right gap
    translate([
        wall_x - gaps - corner,
        wall_y - insert - wall_thickness,
        0
    ]) {
        hgap();
    }
    
    // Bottom side left gap
    translate([corner, 0, 0]) {
        hgap();
    }
    
    // Bottom side right gap
    translate([wall_x - gaps - corner, 0, 0]) {
        hgap();
    }
}

//translate([2*wall_thickness, wall_y - 7, 0]) {
    //cube([support, support, wall_z]);
    //prism(5, 5, wall_z);
    //prism(2, 5, wall_z);
//}


module hgap() {
    cube([gaps, insert + wall_thickness, wall_z]);
}

module vgap() {
    cube([insert + wall_thickness, gaps, wall_z]);
}




module prism(l, w, h) {
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
      
    // preview unfolded (do not include in your function
    z = 0.08;
    separation = 2;
    border = .2;
    
    translate([0,w+separation,0])
        cube([l,w,z]);
    
    translate([0,w+separation+w+border,0])
        cube([l,h,z]);
    
    translate([0,w+separation+w+border+h+border,0])
        cube([l,sqrt(w*w+h*h),z]);
    
    translate([l+border,w+separation,0])
        polyhedron(//pt 0       1       2        3       4       5
            points=[[0,0,0],[h,w,0],[0,w,0], [0,0,z],[h,w,z],[0,w,z]],
            faces=[[0,1,2], [3,5,4], [0,3,4,1], [1,4,5,2], [2,5,3,0]]
        );
        
    translate([0-border,w+separation,0])
        polyhedron(//pt 0       1         2        3       4         5
            points=[[0,0,0],[0-h,w,0],[0,w,0], [0,0,z],[0-h,w,z],[0,w,z]],
            faces=[[1,0,2],[5,3,4],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
        );
}