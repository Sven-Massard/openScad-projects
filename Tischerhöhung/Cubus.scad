difference(){
  cube([50,50,36], center = true);
  
  translate([-15,-15,0])cylinder($fn=32, d=2.75, h= 50, center=true);
  translate([-15,15,0])cylinder($fn=32, d=2.75, h= 50, center=true);
  translate([15,-15,0])cylinder($fn=32, d=2.75, h= 50, center=true);
  translate([15,15,0])cylinder($fn=32, d=2.75, h= 50, center=true);
}