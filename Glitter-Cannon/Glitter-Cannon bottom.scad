fanDiameter = 77;
fanHeight=13;
lowerTubeHeight=30;
wallThickness=3;

distanceHolesFromCenter=40*sin(30)/sin(60);

fanHolderBarsScrewHoleSize=3;
fanHolderBarsLength=fanDiameter/2-distanceHolesFromCenter+fanHolderBarsScrewHoleSize/2+wallThickness;

fanHolderBarsWidth=8;
fanCableHeight=1.5;
fanCableWidth=4.3;

airHolesDiameter=5;

fn=1024;

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
      }
    }
  
  //Screw Holes to combine upper to lower half
  for(angle=[40,160,280]){
    rotate(a=angle)translate([fanDiameter/2-10/2,0,(lowerTubeHeight-wallThickness)/2])difference(){
    cube([10,10,wallThickness], center=true);
    cylinder($fn=fn, d=2, h=wallThickness, center=true);
      }
    }
  }
  
  //Air Holes
  for(angle=[0:20:360]){
    rotate(a=angle)translate([0,0,-lowerTubeHeight/2+(airHolesDiameter+wallThickness)/2])rotate([90,0,0])cylinder($fn=fn, d=airHolesDiameter, h=fanDiameter+wallThickness+airHolesDiameter, center=true);
  }
  
  //Outer cutoff
  difference(){
    cylinder($fn=fn, h=lowerTubeHeight, d=fanDiameter+20, center=true);
    cylinder($fn=fn, h=lowerTubeHeight, d=fanDiameter+2*wallThickness, center=true);  
  }
  
  //Fan cable hole
  translate([-(fanDiameter+wallThickness)/2,0,(lowerTubeHeight-fanCableHeight)/2])cube([wallThickness+1,fanCableWidth,fanCableHeight], center=true);
  
}
