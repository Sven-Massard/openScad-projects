module photoresistorCasing(){
  fn=16;
  baseCubeHeight=22.2;
  photoresistorDiameter=5.1;
  photoresistorHeight=2.2;
  difference(){
    //Basiscubus
    translate([0, 0, 0])cube([photoresistorDiameter+1, photoresistorDiameter+1, baseCubeHeight], center = true);
    
    //Ausschnitt Photoresitor
    translate([0, 0, (baseCubeHeight-photoresistorHeight)/2])difference(){
      cylinder($fn = fn, d=photoresistorDiameter, h=photoresistorHeight, center=true);
      translate([+3/2 + 4.5/2, 0, 0])cube([3, 3, 3], center = true);
      translate([-3/2 - 4.5/2, 0, 0])cube([3, 3, 3], center = true);
    }
    
    //Löcher Beine Lichtsensor. Höhe extra übertrieben, ging nicht anders.
    translate([0,  (4-1)/2, -(baseCubeHeight-20)/2])cylinder($fn = fn, d=2, h=22, center=true);
    translate([0, -(4-1)/2, -(baseCubeHeight-20)/2])cylinder($fn = fn, d=2, h=22, center=true);
  }
}

photoresistorCasing();