DiameterOuterSphere = 50;
wallThickness = 2;
screwDiameter=1.5;
arcLengthOpening=20;
widthOpening=10;
fn = 32;
screwHolesCubeHeight=10;

translate([0, 0, -DiameterOuterSphere/2])difference(){

  // Cube with screw holes
  union(){
    difference(){
      sphere($fn = fn, d=DiameterOuterSphere);
      sphere($fn = fn, d=DiameterOuterSphere-wallThickness);

      //Screw holes
      translate([-DiameterOuterSphere/2, 0, screwHolesCubeHeight/2 + 1])cube([5,5,screwHolesCubeHeight], center = true);
      translate([-DiameterOuterSphere/2, 0, -screwHolesCubeHeight/2 - 1])cube([5,5,screwHolesCubeHeight], center = true);
      translate([DiameterOuterSphere/2, 0, screwHolesCubeHeight/2 + 1])cube([5,5,screwHolesCubeHeight], center = true);
      translate([DiameterOuterSphere/2, 0, -screwHolesCubeHeight/2 - 1])cube([5,5,screwHolesCubeHeight], center = true);
      
      translate([-DiameterOuterSphere/2 +5/4, 0, 0])cylinder($fn=fn, h=2*wallThickness, d=screwDiameter, center=true);
      translate([+DiameterOuterSphere/2 -5/4, 0, 0])cylinder($fn=fn, h=2*wallThickness, d=screwDiameter, center=true);
    }

    difference(){
      union(){
        translate([-DiameterOuterSphere/2+5/2, 0,  (screwHolesCubeHeight+wallThickness)/2])cube([5,5,(screwHolesCubeHeight+wallThickness)], center = true);
        translate([-DiameterOuterSphere/2+5/2, 0, -(screwHolesCubeHeight+wallThickness)/2])cube([5,5,(screwHolesCubeHeight+wallThickness)], center = true);
        translate([ DiameterOuterSphere/2-5/2, 0,   (screwHolesCubeHeight+wallThickness)/2])cube([5,5,(screwHolesCubeHeight+wallThickness)], center = true);
        translate([ DiameterOuterSphere/2-5/2, 0,  -(screwHolesCubeHeight+wallThickness)/2])cube([5,5,(screwHolesCubeHeight+wallThickness)], center = true);
      }
      translate([-DiameterOuterSphere/2 , 0,  screwHolesCubeHeight/2 + wallThickness/2])cube([5,5-wallThickness,screwHolesCubeHeight], center = true);
      translate([-DiameterOuterSphere/2,  0, -screwHolesCubeHeight/2 - wallThickness/2])cube([5,5-wallThickness,screwHolesCubeHeight], center = true);
      translate([ DiameterOuterSphere/2,  0,  screwHolesCubeHeight/2 + wallThickness/2])cube([5,5-wallThickness,screwHolesCubeHeight], center = true);
      translate([ DiameterOuterSphere/2,  0, -screwHolesCubeHeight/2 - wallThickness/2])cube([5,5-wallThickness,screwHolesCubeHeight], center = true);
      
      // Cut out everything outside of sphere
      difference(){
        sphere($fn = fn, d=DiameterOuterSphere+30);
        sphere($fn = fn, d=DiameterOuterSphere);
      }
      
      translate([-DiameterOuterSphere/2 +5/4, 0, 0])cylinder($fn=fn, h=2*wallThickness, d=screwDiameter, center=true);
      translate([+DiameterOuterSphere/2 -5/4, 0, 0])cylinder($fn=fn, h=2*wallThickness, d=screwDiameter, center=true);
    }
  }
  
  lengthOpening=DiameterOuterSphere*sin(arcLengthOpening*360/(2*PI*DiameterOuterSphere/2)/2);
  cube([lengthOpening, widthOpening, DiameterOuterSphere+1], center=true);
  
  //Divider top bottom
  translate([0, 0, -DiameterOuterSphere/4])cube([100, 100, DiameterOuterSphere/2], center=true);
}