include <box.scad>
difference(){
  box(width = 190, height = 160, depth = 150, thickness = 3, assemble = false);
  
  //Hole for ball
  translate([2+5+50/2, 160+150/2])circle(d=50, center=true);
  
  //Hole for Cables
  translate([190 + 20, 160 - 20])circle(d=15, center=true);
  
  //Hole for Box
  translate([190-56-3, +3])square(56, 53);
 
}