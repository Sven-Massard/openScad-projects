holesDistance=20;
screwDiameter=2.9;
screwLength=12;
boxThickness=3;

handleWidth=30;
handleDepth=15;
handleHeight=15;

fn=16;

difference(){
  cube([handleWidth, handleDepth, handleHeight], center=true);
  translate([0, handleDepth/4, -handleHeight/4])cube([handleWidth, handleDepth/2, handleHeight/2], center=true);
  
  //Screw Holes
  translate([-holesDistance/2, handleDepth/2-(screwLength-boxThickness+1)/2, handleHeight/4])rotate([90, 0, 0])cylinder($fn=fn, d=screwDiameter, h=screwLength-boxThickness+1, center=true);
    translate([holesDistance/2, handleDepth/2-(screwLength-boxThickness+1)/2, handleHeight/4])rotate([90, 0, 0])cylinder($fn=fn, d=screwDiameter, h=screwLength-boxThickness+1, center=true);
}
