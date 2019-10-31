module CubeModuleWithRoundTopEdges(width, depth, height, sphereRadius){
  hull(){
    for(x=[sphereRadius, width]){
      for(y=[sphereRadius, depth]){
        translate([x-sphereRadius/2,y-sphereRadius/2,0])cylinder(h=sphereRadius, d=sphereRadius);
        translate([x-sphereRadius/2,y-sphereRadius/2,height-sphereRadius/2])sphere(d=sphereRadius);
      }
    }
  }
}