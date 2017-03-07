// Overall gate size
size = 180;
offset = 10;

// Gate body holes
hole1 = 110; // This is for the air flow
hole2 = 120; // This should accept the coupling

// Inner layers
translate([0, 0, 0]) { gate_square(180, hole1, "inner"); }
translate([0, 185, 0]) { gate_square(180, hole1, "inner"); }

// Outer layers
translate([185, 0, 0]) { gate_square(180, hole2, "outer"); }
translate([185, 185, 0]) { gate_square(180, hole2, "outer"); }

// Side strips
translate([370, 0, 0]) {side_strip(); }
translate([370, 185, 0]) {side_strip(); }

// Handles
translate([395,345,0]) { handle(); }
translate([395,370,0]) { handle(); }

// Gate
translate([395, 0, 0]) { gate([140, 340], hole1); }

module gate(size, hole) {
    
    // Gate
    difference() {
        // Main body
        rounded_square([140,340]);

        // Hole
        translate([70,230,0]) { circle(55, $fn=50); }
  
        // Screw holes left end
        translate([10,10,0]) { circle(2.5, $fn=50); }
        translate([70,10,0]) { circle(2.5, $fn=50); }
        translate([130,10,0]) { circle(2.5, $fn=50); }

        // Screw holes right end
        translate([10,330,0]) { circle(2.5, $fn=50); }
        translate([70,330,0]) { circle(2.5, $fn=50); }
        translate([130,330,0]) { circle(2.5, $fn=50); }
        
        translate([70,95,0]) { 
            text(
                "@idnorton",
                size = 16,
                halign = "center",
                style = "bold"
            ); 
        }
        
        translate([70,75,0]) {
            text(
                "Auto extraction",
                size = 10,
                halign = "center",
                style = "bold"
            ); 
        }
        
        translate([70,60,0]) {
            text(
                "control",
                size = 10,
                halign = "center",
                style = "bold"
            ); 
        }
    }
}

module gate_square(size, hole, label) {
    difference() {
        // Main body
        rounded_square([size,size]);

        // Main hole
        translate([(size/2),(size/2),0]) { circle(hole/2, $fn=50); }

        // Left hand side screws
        translate([offset,offset,0]) { circle(2.5, $fn=50); }
        translate([offset,(offset/2)+(size/4),0]) { circle(2.5, $fn=50); }
        translate([offset,size/2,0]) { circle(2.5, $fn=50); }
        translate([offset,(size/4)*3-(offset/2),0]) { circle(2.5, $fn=50); }
        translate([offset,size-offset,0]) { circle(2.5, $fn=50); }
    
        // Right hand side screws
        translate([size-offset,offset,0]) { circle(2.5, $fn=50); }
        translate([size-offset,(offset/2)+(size/4),0]) { circle(2.5, $fn=50); }
        translate([size-offset,size-offset,0]) { circle(2.5, $fn=50); }
        translate([size-offset,(size/4)*3-(offset/2),0]) { circle(2.5, $fn=50); }
        translate([size-offset,size/2,0]) { circle(2.5, $fn=50); }
    
        translate([35,6,0]) {
            text(
                label,
                size = 10,
                halign = "center",
                style = "bold"
            );
        }
    }
}

module side_strip() {
    difference() {

        // Body
        square([2*offset, size]);
    
        // Holes
        translate([offset,offset,0]) { circle(2.5, $fn=50); }
        translate([offset,(offset/2)+(size/4),0]) { circle(2.5, $fn=50); }
        translate([offset,size/2,0]) { circle(2.5, $fn=50); }
        translate([offset,(size/4)*3-(offset/2),0]) { circle(2.5, $fn=50); }
        translate([offset,size-offset,0]) { circle(2.5, $fn=50); }
    }
}

module rounded_square(s, r=10) {
    translate([r, r])
    minkowski() {
        square([s[0]-(2*r), s[1]-(2*r)]);
        circle(r=r);
    }
}

module handle() {
    difference() {
        square([140, 20]);
  
        // Screw holes
        translate([10,10,0]) { circle(2.5, $fn=50); }
        translate([70,10,0]) { circle(2.5, $fn=50); }
        translate([130,10,0]) { circle(2.5, $fn=50); }
    }
}