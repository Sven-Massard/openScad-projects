toleranz=3;
wandDicke=3;
schubladeTiefe=297-wandDicke;
schubladeHoehe=(303-3*wandDicke)/2-toleranz;
schubladeBreite=236-2*wandDicke-toleranz;
zeichenDistanz=10; //Distanz zwischen den einzelnen Teilen.
steckeckenAnzahl=10;
griffBreite=20;
griffHoehe=20;

//Bodenplatte
difference(){
  square([schubladeBreite, schubladeTiefe]);
  //Steckeckenlöcher für Seitenwände
  for(x=[0, schubladeBreite-wandDicke]){
    for(y=[wandDicke+(schubladeTiefe-2*wandDicke)/steckeckenAnzahl/4: (schubladeTiefe-2*wandDicke)/steckeckenAnzahl: (schubladeTiefe-2*wandDicke)-(schubladeTiefe-2*wandDicke)/steckeckenAnzahl/4-wandDicke]){
      translate([x, y]){
        square([wandDicke, (schubladeTiefe-2*wandDicke)/steckeckenAnzahl/2]);
      }
    }
  }
  //Steckeckenlöcher für Rück- und Vorderwand
  for(y=[0, schubladeTiefe-wandDicke]){
    for(x=[schubladeBreite/steckeckenAnzahl/2/2: schubladeBreite/steckeckenAnzahl: schubladeBreite-schubladeBreite/steckeckenAnzahl/4]){
      translate([x, y]){
        square([schubladeBreite/steckeckenAnzahl/2, wandDicke]);
      }
    }
  }
}


//Seitenwände
for(x=[0:1])
translate([schubladeBreite+zeichenDistanz + x*(schubladeHoehe-wandDicke+zeichenDistanz), 0]){
  square([schubladeHoehe-wandDicke, schubladeTiefe-2*wandDicke]);
  //Steckecken Bodenplatte
  for(y=[(schubladeTiefe-2*wandDicke)/steckeckenAnzahl/4: (schubladeTiefe-2*wandDicke)/steckeckenAnzahl: (schubladeTiefe-2*wandDicke)-(schubladeTiefe-2*wandDicke)/steckeckenAnzahl/4]){
    translate([-wandDicke, y]){
      square([wandDicke, (schubladeTiefe-2*wandDicke)/steckeckenAnzahl/2]);
    }
  }
  
  //Steckecken für Rück- und Vorderwand
  for(x3=[(schubladeHoehe-wandDicke)/steckeckenAnzahl/4:(schubladeHoehe-wandDicke)/steckeckenAnzahl: (schubladeHoehe-wandDicke)-(schubladeHoehe-wandDicke)/steckeckenAnzahl/4]){
    for(y2=[-wandDicke, schubladeTiefe-wandDicke*2]){
      translate([x3,y2])square([(schubladeHoehe-wandDicke)/steckeckenAnzahl/2, wandDicke]);
    }
  }
}

//Vorder und Rückwand
difference(){
  for(x=[0:1]){
    translate([schubladeBreite+zeichenDistanz + (x+2)*(schubladeHoehe-wandDicke+zeichenDistanz), 0]){
      difference(){
        union(){
          square([schubladeHoehe-wandDicke, schubladeBreite]);
          //Steckecken für Bodenplatte
            for(y=[schubladeBreite/steckeckenAnzahl/2/2: schubladeBreite/steckeckenAnzahl: schubladeBreite-schubladeBreite/steckeckenAnzahl/4]){
              translate([-wandDicke, y]){
                square([wandDicke, schubladeBreite/steckeckenAnzahl/2]);
              }
            }
        }
      
        //Steckeckenlöcher für Seitenwand
        for(x3=[(schubladeHoehe-wandDicke)/steckeckenAnzahl/4:(schubladeHoehe-wandDicke)/steckeckenAnzahl: (schubladeHoehe-wandDicke)-(schubladeHoehe-wandDicke)/steckeckenAnzahl/4]){
          for(y2=[0, schubladeBreite-wandDicke]){
            translate([x3,y2])square([(schubladeHoehe-wandDicke)/steckeckenAnzahl/2, wandDicke]);
          }
        }
      }
    }
  }
  //Griff
  translate([schubladeBreite+zeichenDistanz + (2)*(schubladeHoehe-wandDicke+zeichenDistanz) + (schubladeHoehe-wandDicke)-(griffHoehe-griffBreite/2), schubladeBreite/2-griffBreite/2]){
    square([griffHoehe-griffBreite/2, griffBreite]);
    translate([0, griffBreite/2])circle(d=griffBreite);
  }
}