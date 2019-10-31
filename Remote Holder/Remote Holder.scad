height=90;
width=36;
depth=19;
wallThickness=3;
windowHeight=height-wallThickness;
windowWidth=width-8;
windowDepth=wallThickness;

screwDiameterHead=5;
screwDiameterShank=3;
screwOffsetFromWalls=10;
$fn=128;
difference(){
  cube([height+wallThickness, width+2*wallThickness, depth+2*wallThickness]);
  translate([wallThickness, wallThickness, wallThickness])cube([height, width, depth]);
  translate([wallThickness, (wallThickness*2+width-windowWidth)/2, depth+wallThickness])cube([windowHeight, windowWidth, windowDepth]);
  
  //Screw holes
  translate([height-screwOffsetFromWalls, (width+2*wallThickness)/2, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
  
  translate([wallThickness+screwOffsetFromWalls, (width+2*wallThickness)/2, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
  
  //Make top edges round:
  //We want to cut off half wallThickness off top edges
  radiusOuterCylinder=sqrt( pow((depth+2*wallThickness),2) + pow((((width+2*wallThickness)/2)),2) );
  radiusInnerCylinder=radiusOuterCylinder-1/2*wallThickness;
  extraToAccountForRoundingError=2;
  echo(radiusOuterCylinder);
  translate([-extraToAccountForRoundingError/2, (width+2*wallThickness)/2, 0])rotate([0, 90, 0])difference(){
    cylinder(height+wallThickness+extraToAccountForRoundingError, r=radiusOuterCylinder+extraToAccountForRoundingError);
    cylinder(height+wallThickness+extraToAccountForRoundingError, r=radiusInnerCylinder);
  }
}