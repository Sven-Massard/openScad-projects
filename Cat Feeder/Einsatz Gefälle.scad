difference(){
  cylinder($fn= 128, d=72, h=50,center = true);
  // Ausschnitt Futterdurchlass
  rotate([0, 0, 40])intersection(){
    difference(){
      cylinder($fn= 128, d=74.5, h=50,center = true);
      cylinder($fn= 128, d=42.5, h=50,center = true);
    }
  
    polyhedron(
      points=[ [0, 0,  25], [75, 0,  25], [75*cos(100), 75*sin(100),  25],
               [0, 0, -25], [75, 0, -25], [75*cos(100), 75*sin(100), -25] ],
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
  
  // Ausschnitt Gefälle
  translate([0, 72.5/2, 0])cylinder($fn= 128, d1=72 - 42.5, d2=74.5  + 72.5, h=50,center = true);
  
}
//// Anti Verrutschklemmen
//x = (42.5 + (72 - 42.5)/2 )/2;
//translate([x*cos(50), x*cos(50), -25 + 3/2])rotate([0, 0, -50])cube([2, (72-42.5)/2, 3], center = true);