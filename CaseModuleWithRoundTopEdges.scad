module CaseModuleWithRoundTopEdges(innerWidth, innerDepth, innerHeight, wallThickness){
  difference(){
    hull(){
      for(x=[wallThickness, innerWidth+2*wallThickness]){
        for(y=[wallThickness, innerDepth+2*wallThickness]){
          translate([x-wallThickness/2,y-wallThickness/2,0])cylinder(h=wallThickness, d=wallThickness);
          translate([x-wallThickness/2,y-wallThickness/2,innerHeight+3/2*wallThickness])sphere(d=wallThickness);
        }
      }
    }
    translate([wallThickness,wallThickness,wallThickness])cube([innerWidth, innerDepth, innerHeight]);
  }

}