d1 = 105;
d2 = 115;
wall = 2;
height = 10;

// Tapered cone
difference() {
  cylinder($fn=100, h=height, r1=d2/2, r2=d1/2, center=true);
  cylinder($fn=100, h=height, r1=d2/2 - wall, r2=d1/2 - wall, center=true);
   
  // Gap for mounting holes
  cube([30,d2,height], center=true);
}

// Sealed end
translate([0, 0, 0 - (height/2)]) {
  cylinder (h = 2, r=d2/2+wall, center = true, $fn=100);
}