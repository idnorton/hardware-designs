/*



Settings for these parts in PrusaSlicer:
  
## Print Settings

Select the Print Settings tab and check the following.

### Layers and perimeters

Perimiters: 4
Seam position: Random

### Infill

Fill density: 25%
Fill pattern: cubic

*/

cup_d = 45;
cup_h = 14;

height = 35;
diameter = 25;
wall = 2;

// d1 = top
// d2 = bottom

difference() {

  union() {
    // Outer body
    cylinder(
      h = height + cup_h,
      d1 = cup_d + (4 * wall),
      d2 = diameter + (4 * wall),
      $fn = 200
    );

    // Circular foot
    cylinder(h = height + cup_h + 1, d = diameter, $fn = 200);
  }

  // Hole through the middle
  cylinder(h = height + cup_h + 1, d1 = diameter + wall, d2 = diameter - (2 * wall), $fn = 200);

  // Dish for existing foot
  cylinder(h = cup_h, d1 = cup_d + (2*wall), d2 = cup_d, $fn = 200);
  //cylinder(h = 17, d = 25, $fn = 200);
}