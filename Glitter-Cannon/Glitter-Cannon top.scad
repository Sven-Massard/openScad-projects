include <photoresistorCasing.scad>
include <piezoCasing.scad>
fanDiameter = 80;
upperTubeHeight=20;
wallThickness=3;

distanceHolesFromCenter=40*sin(30)/sin(60);

fanHolderBarsScrewHoleSize=3;
fanHolderBarsLength=fanDiameter/2-distanceHolesFromCenter+fanHolderBarsScrewHoleSize/2+wallThickness;
fanHolderBarsWidth=8;

fn=32;

difference(){
  union(){
    difference(){
      cylinder($fn=fn, h=upperTubeHeight, d=fanDiameter+2*wallThickness, center=true);
      cylinder($fn=fn, h=upperTubeHeight, d=fanDiameter, center=true);  
    }
  
  //Screw Holes to combine upper to lower half
  for(angle=[40,160,280]){
    rotate(a=angle)translate([fanDiameter/2-10/2,0,(-upperTubeHeight+wallThickness)/2])difference(){
    cube([10,10,wallThickness], center=true);
    cylinder($fn=fn, d=2, h=wallThickness, center=true);
      }
    }
  }
  
  
  //Outer cutoff
  difference(){
    cylinder($fn=fn, h=upperTubeHeight, d=fanDiameter+20, center=true);
    cylinder($fn=fn, h=upperTubeHeight, d=fanDiameter+wallThickness*2, center=true);  
  }
}

photoresistorCubeHeight=11.1;
photoresistorCubeWidth=6.5;
translate([(fanDiameter+photoresistorCubeWidth)/2+wallThickness-0.5,0,(upperTubeHeight-photoresistorCubeHeight)/2])rotate([0,-90,0])photoresistorCasing();

piezoCasingCubeWidth= 11.3;
piezoCasingHeight=6.6;
rotate(20)translate([(fanDiameter+piezoCasingCubeWidth)/2+wallThickness-0.5,0,(upperTubeHeight-piezoCasingHeight)/2])piezoCasing(fn);