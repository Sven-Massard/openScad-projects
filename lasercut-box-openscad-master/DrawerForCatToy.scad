include <box.scad>
screwDiameter=2.9;
tolerance=0.6;
difference(){
  box(width = 56-tolerance, height = 53-tolerance, depth = 150-3-tolerance, thickness = 3, assemble = false);
  //Hole for Drawer Handles
  translate([(56-tolerance)/2+10, 53-13])circle(d=screwDiameter+1,center=true);
  translate([(56-tolerance)/2-10, 53-13])circle(d=screwDiameter+1,center=true);
}