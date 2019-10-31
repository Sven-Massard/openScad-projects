include <CubeModuleWithRoundTopEdges.scad>
width=36;
depth=19;

wallThickness=4;
windowHeight=60;
windowWidth=width-8;
windowDepth=wallThickness;
windowHeightOffset=35;

height=windowHeight+windowHeightOffset+wallThickness;

edgeRounding=5;

screwDiameterHead=8;
screwDiameterShank=3;

$fn=32;
difference(){
  CubeModuleWithRoundTopEdges(width+2*wallThickness, height+wallThickness, depth+2*wallThickness, edgeRounding);
  
  translate([wallThickness, wallThickness, wallThickness])cube([ width, height, depth]);
  
  //Window
  translate([ (wallThickness*2+width-windowWidth)/2, windowHeightOffset+wallThickness,depth+wallThickness])cube([windowWidth, windowHeight, windowDepth]);
  
  //Screw holes
  translate([(width+2*wallThickness)/2, windowHeightOffset+screwDiameterHead/2+wallThickness+1, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
  
  translate([(width+2*wallThickness)/2, windowHeightOffset+windowHeight+wallThickness-screwDiameterHead/2-1, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
}