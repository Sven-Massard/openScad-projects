fn = 16;
cubeInnerLength=14;
cubeInnerWidth=15.5;
cubeInnerHeight=9;
wallthickness=2;
laserBarrelRadius=6;
platinenBreite=15;
innerCubeDelta=2;
screwTotalLength=11.2;
screwHeadHeight=1.25;
screwHeadDiameter=4;
screwXOffset=2;
screwYOffset=4.9;
nutHeight=1.5;

difference(){
  cube([cubeInnerWidth + 2*wallthickness, cubeInnerLength + 2*wallthickness, cubeInnerHeight + 2*wallthickness], center=true);
  translate([0, -innerCubeDelta, 0])cube([cubeInnerWidth, cubeInnerLength, cubeInnerHeight], center=true);
  translate([-0.5, cubeInnerLength/2, 1-0.3-0.5])rotate([90, 0, 0])cylinder($fn = fn, d=laserBarrelRadius + 0.3, h=2*innerCubeDelta, center=true);
  
  //Löcher Schrauben
  translate([platinenBreite/2-screwXOffset, cubeInnerLength/2-screwYOffset-innerCubeDelta, -wallthickness])cylinder($fn = fn, h=cubeInnerHeight + wallthickness, d=2, center=true);
  translate([-(platinenBreite/2-screwXOffset), cubeInnerLength/2-screwYOffset-innerCubeDelta, -wallthickness])cylinder($fn = fn, h=cubeInnerHeight + wallthickness, d=2, center=true);
  
  //Löcher Schraubköpfe
  translate([platinenBreite/2-screwXOffset, cubeInnerLength/2-screwYOffset-innerCubeDelta, -(cubeInnerHeight + 2*wallthickness-screwHeadHeight)/2])cylinder($fn = fn, h=screwHeadHeight, d=screwHeadDiameter, center=true);
  translate([-(platinenBreite/2-screwXOffset), cubeInnerLength/2-screwYOffset-innerCubeDelta, -(cubeInnerHeight + 2*wallthickness-screwHeadHeight)/2])cylinder($fn = fn, h=screwHeadHeight, d=screwHeadDiameter, center=true);
  
  //Seitenlöcher für Mutternbefestigung
  translate([(cubeInnerWidth+wallthickness)/2,0,0])cube([wallthickness, 10, cubeInnerHeight], center=true);
  translate([-(cubeInnerWidth+wallthickness)/2,0,0])cube([wallthickness, 10, cubeInnerHeight], center=true);
}