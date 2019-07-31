difference(){  
  union(){
    //Wanne mit Lautsprecherlöchern und Zylinder für Schraublöcher
    difference(){ //Cubus mit Zylindern für Schraublöcher
      union(){
        cube([49.7, 24.8, 9], center = true);
        //Zylinder für Schrauben ohne Mittelloch
        translate([ 25.5,0,1])cylinder(h=7, r1=2.45, r2=3.75, center = true);
        translate([-25.5,0,1])cylinder(h=7, r1=2.45, r2=3.75, center = true);
      }
      //Ausgeschnittener Cubus
      translate([0, 0, 1])cube([45.7, 20.8, 7], center = true);
      //Löcher für Lautsprecher
      translate([12.96,0,-3.5])cylinder(h = 2, d = 16.5, center = true);
      translate([-12.96,0,-3.5])cylinder(h = 2, d = 16.5, center = true);
    }
    
    //Eckerhöhungen
    translate([0,0, -1.2])difference(){ 
      union(){ // Eckbalken
        translate([ 22.1, 0, 0])cube([1.5, 20.8, 4], center = true);
        translate([-22.1, 0, 0])cube([1.5, 20.8, 4], center = true);
      }
      translate([0, 0, -3.9])cylinder(h = 9, r = 22.2); //Ausgeschnittener Kreis      
    }
    
    //Mittelbalken
    translate([0,0,-1.2])cube([4, 8, 4], center = true);
  

    
    //Falz
    translate([0,0,5])difference(){
      union(){
        cube([49.7, 24.8, 1], center = true);
        // Zylinder für Schrauben ohne Mittelloch
        translate([ 25.5,0,0])cylinder(h=1, r=3.75, center = true);
        translate([-25.5,0,0])cylinder(h=1, r=3.75, center = true);
      }
      cube([47.7, 22.8, 1], center = true);
    }
  }
  // Mittelloch in Zylinder für Schrauben
  translate([ 25.5,0,2])cylinder($fn=16, h=7, r=1.45, center = true);
  translate([-25.5,0,2])cylinder($fn=16, h=7, r=1.45, center = true);
  
}