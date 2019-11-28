radiusSphere=100;
thicknessStand=20;
tolerance=0.2;
fn=32;

difference(){
  sphere($fn=fn, r=radiusSphere);
  translate([0,0,-radiusSphere])cube([2*radiusSphere,2*radiusSphere,2*radiusSphere], true);
  
  //Hole for stand
  translate([0,0,thicknessStand/2])cube([thicknessStand+tolerance,thicknessStand+tolerance,thicknessStand], true);
}

