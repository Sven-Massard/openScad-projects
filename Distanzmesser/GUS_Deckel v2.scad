difference(){
  union(){
    cube([49.7, 24.8, 2], center = true);
    
    //Falz
    translate([0, 0, 1.5])cube([47.7, 22.8, 1], center = true);
    
    // Zylinder für Schrauben ohne Mittelloch
    translate([ 25.5, 0, 0])cylinder(h=2, r=3.75, center = true);
    translate([-25.5, 0, 0])cylinder(h=2, r=3.75, center = true);
  }
  

  
  // Eckiges Loch für Pins
  translate([0, 9.9,  0.5])cube([11, 5, 3], center = true);
  
  
  // Senke für Schrauben
  translate([ 25.5, 0, 0])cylinder($fn=16, h=2, r1=2.75, r2=1.45, center = true);
  translate([-25.5, 0, 0])cylinder($fn=16, h=2, r1=2.75, r2=1.45, center = true);
}