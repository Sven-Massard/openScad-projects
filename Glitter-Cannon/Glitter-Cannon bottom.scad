fanDiameter = 80;
fanHeight=13;
lowerTubeHeight=30;
wallThickness=2;

distanceHolesFromCenter=40*sin(30)/sin(60);

fanHolderBarsScrewHoleSize=2.8;
fanHolderBarsLength=fanDiameter/2-distanceHolesFromCenter+fanHolderBarsScrewHoleSize/2+wallThickness;

fanHolderBarsWidth=8;
fanCableHeight=1.5;
fanCableWidth=4.3;

airHolesDiameter=5;

lowerPlateScrewHoleSize = 3.4;
lowerPlateScrewLength = 15;
lowerPlateBarLength = 10;
lowerPlateBarWidth = 10;

fn=128;

difference(){
  union(){
    difference(){
      cylinder($fn=fn, h=lowerTubeHeight, d=fanDiameter+2*wallThickness, center=true);
      cylinder($fn=fn, h=lowerTubeHeight, d=fanDiameter, center=true);  
    }
    
  //Fan Holder
  translate([0,0,(lowerTubeHeight-wallThickness)/2])for(angle=[0,120,240]){
      rotate(a=angle)difference(){
        translate([(fanDiameter-fanHolderBarsLength)/2,0,0])cube([fanHolderBarsLength,fanHolderBarsWidth,wallThickness], center=true);
        translate([distanceHolesFromCenter,0,0])cylinder($fn=fn, h=wallThickness, d=3.1, center=true);
        
        //Screw Holes for top with magic number
        translate([distanceHolesFromCenter+10,0,0])cylinder($fn=fn, d=2, h=wallThickness, center=true);
        
      }
    }
  }
  //Outer cutoff
  difference(){
    cylinder($fn=fn, h=lowerTubeHeight, d=fanDiameter+20, center=true);
    cylinder($fn=fn, h=lowerTubeHeight, d=fanDiameter+2*wallThickness, center=true);  
  }
  
  //Fan cable hole
  translate([-(fanDiameter+wallThickness)/2,0,(lowerTubeHeight-fanCableHeight)/2])cube([wallThickness+1,fanCableWidth,fanCableHeight], center=true);

  //Air holes
  tubeInnerCircumference = PI*fanDiameter;
  airHoleWidth = (tubeInnerCircumference-8*wallThickness)/8;
  for(angle=[0,45,90,135]){
    rotate(a=angle)cube([fanDiameter+2*wallThickness, airHoleWidth, lowerTubeHeight-2*wallThickness], center=true);
  }
  
}

//Screws for bottom
translate([0,0,-(lowerTubeHeight-lowerPlateScrewLength)/2])for(angle=[22.5,22.5+90,22.5+180,22.5+270]){
  rotate(a=angle)difference(){
    translate([(fanDiameter+lowerPlateBarLength)/2,0,0])cube([lowerPlateBarLength,lowerPlateBarWidth,lowerPlateScrewLength], center=true);
    //Screw Holes for top
    translate([(fanDiameter+lowerPlateBarLength)/2,0,0])cylinder($fn=fn, d=lowerPlateScrewHoleSize, h=lowerPlateScrewLength, center=true);
    
  }
}
