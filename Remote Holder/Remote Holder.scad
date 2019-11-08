include <CubeModuleWithRoundTopEdges.scad>
include <Prism.scad>
// There is no tolerance, so add your own tolerance
width=36;
remoteDepth=17; //without buttons
buttonHeight=2;

wallThickness=4;
windowHeight=60;
windowWidth=width-8;
windowDepth=buttonHeight+wallThickness;
windowHeightOffset=35;

height=windowHeight+windowHeightOffset+wallThickness;

edgeRounding=5;

screwDiameterHead=8;
screwDiameterShank=3;
screwClearance=1;

$fn=16;
difference(){
  CubeModuleWithRoundTopEdges(width+2*wallThickness, height+wallThickness, remoteDepth+buttonHeight+2*wallThickness, edgeRounding);
  
  translate([wallThickness, wallThickness, wallThickness])cube([ width, height, remoteDepth]);
  
  
  
  //Ramps for remote
  //for(x=[wallThickness, width]){
    translate([wallThickness, windowHeightOffset+wallThickness,  remoteDepth+wallThickness])prism(width,windowHeight+wallThickness,buttonHeight);
  //}
  
  //translate([wallThickness+(width-windowWidth)/2, height, remoteDepth+wallThickness])cube([windowWidth, wallThickness, buttonHeight]);
  
  //Window
  translate([ (wallThickness*2+width-windowWidth)/2, windowHeightOffset+wallThickness,remoteDepth+wallThickness])cube([windowWidth, windowHeight, windowDepth]);
  
  //Screw holes
  translate([(width+2*wallThickness)/2, windowHeightOffset+screwDiameterHead/2+wallThickness+screwClearance, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
  
  translate([(width+2*wallThickness)/2, windowHeightOffset+windowHeight+wallThickness-screwDiameterHead/2-screwClearance, 0])cylinder(wallThickness, d1=screwDiameterShank, d2=screwDiameterHead);
}