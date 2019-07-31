//Oberer Zylinder
translate([0, 0, 52])difference(){
  // Zylinder
  cylinder($fn= 16, d=77.5, h=100,center = true);
  cylinder($fn= 16, d=73.5, h=100,center = true);
  
  // Rille für Pringelsdeckel
  translate([0, 0, 48-0.3/2])difference(){ 
    cylinder($fn= 16, d=77.5, h=0.3,center = true);
    cylinder($fn= 16, d=76.5, h=0.3,center = true);
  }
}

// Unterseite
difference(){
  cylinder($fn= 16, d=77.5, h=4,center = true);
  
  // Ausschnitt Futterdurchlass
  rotate([0, 0, 40])intersection(){
    difference(){
      cylinder($fn= 16, d=72.5, h=4,center = true);
      cylinder($fn= 16, d=42.5, h=4,center = true);
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
  
  // Ausschnitt für Fixierflügel 
  translate([0, 0, 0.5])union(){
    intersection(){
      cube([38, 11.9, 3], center = true);
      translate([14.625/2 + 8.75/2, 0, 0])rotate([0, 90, 0])rotate([0, 0, 45])cylinder($fn = 4, d1=11.9/(sin(45)), d2=5.5, h=14.625, center=true);
    }
    intersection(){
      cube([38, 11.9, 3], center = true);
      translate([-(14.625/2 + 8.75/2), 0, 0])rotate([0, 90, 0])rotate([0, 0, 45])cylinder($fn = 4, d1=5.5, d2=11.9/(sin(45)), h=14.625, center=true);
    }
    cube([8.75, 11.9 ,3], center = true);
  }
  
  // Loch für Fixierflügel
  translate([0, 0, -1.5])cylinder($fn= 16, d=8.8, h=1, center = true);
}