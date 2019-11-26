thicknessStand=20;

difference(){
  union(){
    translate([0,0,-15])cube([thicknessStand, thicknessStand, 70], true);
    translate([10+50,0,-40])cube([100, thicknessStand, thicknessStand], true);
    translate([110, 0, -40])cube([5, 3*thicknessStand, thicknessStand], true);
  }
  
  // Screw holes
  translate([110,20,-40])rotate([0,90,0])cylinder(r1=5, r2=3, h=5, center=true);
  translate([110,-20,-40])rotate([0,90,0])cylinder(r1=5, r2=3, h=5, center=true);
}