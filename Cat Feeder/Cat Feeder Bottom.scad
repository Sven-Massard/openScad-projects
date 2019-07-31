difference(){
  cylinder($fn=16, d = 100, h = 120, center = true);
  translate([0, 0, -1.5])cylinder($fn=16, d = 96, h = 117, center = true);
  
  // Servo Loch
  translate([0, 0, 58.5])cylinder($fn=16, d=9.2, h=3, center = true);
  
  // Ausschnitt Futterdurchlass
  translate([0, 0, 58.5])rotate([0, 0, 40])intersection(){
    difference(){
      cylinder($fn=16, d=72.5, h=3,center = true);
      cylinder($fn=16, d=42.5, h=3,center = true);
    }
  
    polyhedron(
      points=[ [0, 0,  2,], [75, 0,  2], [75*cos(100), 75*sin(100),  2],
               [0, 0, -2,], [75, 0, -2], [75*cos(100), 75*sin(100), -2] ],
      faces=
              [[0,1,2], // Unterer Deckel
              [0,4,1], // Abdeckung x-Seite
              [0,3,4], // Abdeckung x-Seite
              [0,5,3], // Abdeckung schiefe Seite
              [0,2,5], // Abdeckung schiefe Seite
              [1,5,2], // Abdeckung Hypothenuse
              [1,4,5], // Abdeckung Hypothenuse
              [3,5,4]  // Oberer Deckel
              ]
    );
  }
  //Ausschnitt Futterdurchlass Seite
  translate([0, -2*sqrt(2), 9])rotate([-90, 0, 0])difference(){
    cylinder($fn=16, d1=0, d2=2*55*tan(100/2), h=2*55/2);
    translate([0, -50, 50])cube([200,100,100], center = true);
  }
  //Ausschnitt Kabelloch
  translate([0, -50, -30])rotate([90, 0, 0])cylinder(d=10, h=20, center = true);
}  
//Kanal Futter
translate([0, 0, 118/2 - 25])rotate([0, 0, 40])difference(){
  translate([-2, -2, 0])difference(){
      polyhedron(
        points=[ [0, 0,  25,], [75, 0,  25], [75*cos(100), 75*sin(100),  25],
                 [0, 0, -55,], [75, 0, -55], [75*cos(100), 75*sin(100), -55] ],
        faces=
                [[0,1,2], // Unterer Deckel
                [0,4,1], // Abdeckung x-Seite
                [0,3,4], // Abdeckung x-Seite
                [0,5,3], // Abdeckung schiefe Seite
                [0,2,5], // Abdeckung schiefe Seite
                [1,5,2], // Abdeckung Hypothenuse
                [1,4,5], // Abdeckung Hypothenuse
                [3,5,4]  // Oberer Deckel
                ]
      );
    cylinder($fn=16, d=42.5, h=110,center = true);
  }
  
  difference(){
      polyhedron(
        points=[ [0, 0,  25,], [75, 0,  25], [75*cos(100), 75*sin(100),  25],
                 [0, 0, -55,], [75, 0, -55], [75*cos(100), 75*sin(100), -55] ],
        faces=
                [[0,1,2], // Unterer Deckel
                [0,4,1], // Abdeckung x-Seite
                [0,3,4], // Abdeckung x-Seite
                [0,5,3], // Abdeckung schiefe Seite
                [0,2,5], // Abdeckung schiefe Seite
                [1,5,2], // Abdeckung Hypothenuse
                [1,4,5], // Abdeckung Hypothenuse
                [3,5,4]  // Oberer Deckel
                ]
      );
    cylinder($fn=16, d=42.5, h=110,center = true);
  }
  difference(){ // Alles über der Außenwand abschneiden
    cylinder($fn=16, d = 200, h = 120, center = true);
    cylinder($fn=16, d = 96, h = 120, center = true);
  }
}

//Futterkanal unten:
difference(){
  translate([0, -2*sqrt(2), 9])rotate([-90, 0, 0])difference(){
    cylinder($fn=16, d1=0, d2=2*55*tan(100/2), h=2*55/2);
    translate([0, 0, 2])cylinder($fn=16, d1=0, d2=2*55*tan(100/2), h=2*55/2);
    translate([0, -50, 50])cube([200,100,100], center = true);
  }
  cylinder($fn=16, d=42.5, h=110,center = true);
}

//Rahmen Servo
translate([0, -10.75, 117/2 - 1.5 - 4])difference(){
  cube([24, 45, 8], center = true);
  cube([20, 41, 8], center = true);
}

//Schraubenlöcher
translate([9.5/2, 48.5/2 - 10.75, 117/2 - 1.5 - 4]){
  difference(){
  cylinder($fn=16, d=4.3, h=8, center = true);  
  cylinder($fn=16, d=2.3, h=8, center = true);
  }
}
translate([-9.5/2, 48.5/2 - 10.75, 117/2 - 1.5 - 4]){
  difference(){
  cylinder($fn=16, d=4.3, h=8, center = true);  
  cylinder($fn=16, d=2.3, h=8, center = true);
  }
}
translate([9.5/2, -48.5/2 - 10.75, 117/2 - 1.5 - 4]){
  difference(){
  cylinder($fn=16, d=4.3, h=8, center = true);  
  cylinder($fn=16, d=2.3, h=8, center = true);
  }
}
translate([-9.5/2, -48.5/2 - 10.75, 117/2 - 1.5 - 4]){
  difference(){
  cylinder($fn=16, d=4.3, h=8, center = true);  
  cylinder($fn=16, d=2.3, h=8, center = true);
  }
}