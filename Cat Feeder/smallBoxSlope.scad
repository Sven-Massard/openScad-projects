thickness = 3;
toleranceOfBox=0.6;
tolerance=1;
width = 56-toleranceOfBox-thickness*2-tolerance;
height = 53-toleranceOfBox-thickness*2;
depth = 150-3-toleranceOfBox-thickness*2-tolerance;
angle=3;
difference(){
  cube([width, depth, height]);
  rotate([angle, 0, 0])cube([width, depth+100, height]);
}
echo(depth*tan(angle));