boxWidth = 195;
boxLength = 255;

fanDiameter = 80;
wallThickness=2;

lowerPlateScrewHoleSize = 3.4;
lowerPlateBarLength = 10;

batteryCompartmentLength=120;
batteryCompartmentWidth=60;
batteryCompartmentScrewDiameter=3.8;
batteryCompartmentScrewDistance=87;

fn=32;

//Screw holes for Cannon
difference(){
  square([boxLength, boxWidth], center=true);
  
  //Screws for bottom
  translate([(-boxLength+fanDiameter+lowerPlateBarLength)/2+5, (-boxWidth+fanDiameter+lowerPlateBarLength)/2+5]){
    circle(d=fanDiameter+2*wallThickness);
    for(angle=[0,90,180,270]){
      rotate(a=angle)difference(){
        //Screw Holes for top with magic number
        translate([(fanDiameter+lowerPlateBarLength)/2,0])circle($fn=fn, d=lowerPlateScrewHoleSize, center=true);
      }
    }
  }
  //Battery Compartment
  translate([boxLength/2-batteryCompartmentLength/2, -boxWidth/2+batteryCompartmentWidth/2]){
    square([batteryCompartmentLength, batteryCompartmentWidth], center=true);
    translate([-batteryCompartmentScrewDistance/2, 0])circle($fn=fn, d=batteryCompartmentScrewDiameter);
    translate([batteryCompartmentScrewDistance/2, 0])circle($fn=fn, d=batteryCompartmentScrewDiameter);
  }
}