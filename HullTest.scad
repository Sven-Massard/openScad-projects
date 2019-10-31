height = 20;
width = 10;
depth = 5;
wallThickness=3;
$fn=128;
hull(){
  for(x=[0, width]){
    for(y=[0, height]){
      for(z=[0, depth]){
        translate([x,y,z])sphere(d=wallThickness);
      }
    }
  }
}