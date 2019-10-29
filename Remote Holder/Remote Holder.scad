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
difference(){
  cube([height+wallThickness, width+2*wallThickness, depth+2*wallThickness]);
  translate([wallThickness, wallThickness, wallThickness])cube([height, width, depth]);
  translate([wallThickness, (wallThickness*2+width-windowWidth)/2, depth+wallThickness])cube([windowHeight, windowWidth, windowDepth]);
  
  //Screw holes
  translate([height-screwOffsetFromWalls, (width+2*wallThickness)/2, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
  
  translate([wallThickness+screwOffsetFromWalls, (width+2*wallThickness)/2, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
}