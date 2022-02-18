//cube([3,5,7]);
//sphere([20, $fn=100]); 
//cylinder([10,3,0]);

r1 = 95;
r2 = 105;
wall = 8;
height = 50;

difference() {
 cylinder($fn=500, h=height, r1=r2, r2=r1, center=true);
 cylinder($fn=500, h=height, r1=r2 - wall, r2=r1 - wall, center=true);
}

translate([0, 0, 0 - (height/2)]) {
  cylinder (h = 4, r=r2+wall, center = true, $fn=100);
}
 
 //cylinder(  15,    10,    0,        true);
 //cylinder(h=15, d1=20, d2=0, center=true);
