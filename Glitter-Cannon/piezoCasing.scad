
module piezoCasing(fn){
  piezoDiameter=9.8;
  piezoHeight=5.6;
  contactsDistance=5;
  wallThickness=1;
  translate([0,0,-(piezoHeight-wallThickness)/2]){
    difference(){
      translate([0,0,piezoHeight/2])cube([piezoDiameter+2*wallThickness,piezoDiameter+2*wallThickness,piezoHeight], center=true);
      cylinder($fn=fn, h=piezoHeight, d=piezoDiameter);
    }
    translate([0,0,-wallThickness])difference(){
      translate([0,0,wallThickness/2])cube([piezoDiameter+2*wallThickness,piezoDiameter+2*wallThickness,wallThickness], center=true);
      cylinder($fn=fn, h=wallThickness, d=contactsDistance+2);
    }
  }
}