module photoresistorCasing(){
  fn=16;
  baseCubeHeight=11.1;
  photoresistorDiameter=5.5;
  photoresistorHeight=4.8;
  photoresistorDepth=2.5;
  difference(){
    //Basiscubus
    translate([0, 0, 0])cube([baseCubeHeight, photoresistorDiameter+1, photoresistorDiameter+1], center = true);
    
    //Ausschnitt Photoresitor
    translate([ (baseCubeHeight-photoresistorDepth)/2, 0, 0])difference(){
      rotate([0, 90, 0])cylinder($fn = fn, d=photoresistorDiameter, h=photoresistorDepth, center=true);
      translate([0, 0, +3/2 + photoresistorHeight/2])cube([3, 3, 3], center = true);
      translate([0, 0, -3/2 - photoresistorHeight/2])cube([3, 3, 3], center = true);
    }
    
    //Löcher Beine Lichtsensor. Höhe extra übertrieben, ging nicht anders.
    translate([-(baseCubeHeight-20)/2,  (4-1)/2, 0])rotate([0, 90, 0])cylinder($fn = fn, d=2, h=22, center=true);
    translate([-(baseCubeHeight-20)/2, -(4-1)/2, 0])rotate([0, 90, 0])cylinder($fn = fn, d=2, h=22, center=true);
  }
  
  //Test Stab zum Ausrichten
//  translate([ (baseCubeHeight-photoresistorDepth)/2, 0, 0]){
//  rotate([0, 90, 0])cylinder($fn = fn, d=photoresistorDiameter, h=150, center=true);
//  }
}