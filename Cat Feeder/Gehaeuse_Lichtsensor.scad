module photoresistorCasing(){
  difference(){
    union(){
      difference(){
        //Basiscubus
          translate([0, 0, 0])cube([4.5*2 + 3, 5.1+1, 22.2], center = true);
        
        //Ausschnitt Photoresitor
        translate([-3/2, 0, (22.2-2.2)/2])difference(){
          cylinder($fn = 16, d=5.1, h=2.2, center=true);
          translate([+3/2 + 4.5/2, 0, 0])cube([3, 3, 3], center = true);
          translate([-3/2 - 4.5/2, 0, 0])cube([3, 3, 3], center = true);
        }
        
      }
  
    //Löcher Beine Lichtsensor. Höhe extra übertrieben, ging nicht anders.
    translate([-3/2,  (4-1)/2, -(22.2-20)/2])cylinder($fn = 16, d=2, h=22, center=true);
    translate([-3/2, -(4-1)/2, -(22.2-20)/2])cylinder($fn = 16, d=2, h=22, center=true);
  }
}