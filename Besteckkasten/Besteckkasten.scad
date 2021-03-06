schubladenTiefe = 465;
schubladenBreite= 295;
schubladenHoehe=60;
wandDicke=3;
steckeckenLaenge=20;
laengeUntereLinkeFaecher = 165;
laengeUntereRechteFaecher = 230;


basisplattenTiefeFuerBesteck = schubladenTiefe - 2*wandDicke;
basisplattenBreiteFuerBesteck = schubladenBreite - 2*wandDicke;
zwischenwandTiefe=basisplattenTiefeFuerBesteck-2*wandDicke;
trennwandBreite=(basisplattenBreiteFuerBesteck-wandDicke*6)/5;

difference(){
//Basisplatte
  square([schubladenBreite, schubladenTiefe]);
  //Löcher für Steckecken vertikale Zwischenwände
  translate([wandDicke, wandDicke])for(x=[0:(basisplattenBreiteFuerBesteck-wandDicke)/5:basisplattenBreiteFuerBesteck-wandDicke]){
    for(y=[wandDicke: (zwischenwandTiefe-steckeckenLaenge)/10: zwischenwandTiefe]){
      translate([x, y])square([wandDicke, steckeckenLaenge]);
    }
  }
  
  //Löcher für Steckecken obere und unter Wand
  for(y=[wandDicke,basisplattenTiefeFuerBesteck]){
    translate([0, wandDicke+y]){
      for(x=[(basisplattenBreiteFuerBesteck/5)/2-steckeckenLaenge/2:basisplattenBreiteFuerBesteck/5:basisplattenBreiteFuerBesteck]){
        translate([x, -wandDicke])square([steckeckenLaenge, wandDicke]);
      }
    }
  }
  //Löcher Steckecken für Trennwände
  for(x=[0,1]){
      translate([2*wandDicke+trennwandBreite/2-steckeckenLaenge/2 + x*(trennwandBreite+wandDicke), laengeUntereLinkeFaecher + 2*wandDicke])square([steckeckenLaenge, wandDicke]);
  }
  for(x=[2,3,4]){
      translate([2*wandDicke+trennwandBreite/2-steckeckenLaenge/2 + x*(trennwandBreite+wandDicke), laengeUntereRechteFaecher + 2*wandDicke])square([steckeckenLaenge, wandDicke]);
  }
  
}

//Zwischenwände vertikal
translate([0, wandDicke])for(x=[0:5]){
  translate([schubladenBreite + 5*(x+1) + schubladenHoehe*x, wandDicke]){
    difference(){
      union(){
        square([schubladenHoehe, zwischenwandTiefe]);
        //Steckecken zu GrundPlatte
        for(y=[0: (zwischenwandTiefe-steckeckenLaenge)/10: zwischenwandTiefe]){
          translate([-wandDicke, y])square([wandDicke, steckeckenLaenge]);
        }
        //Steckecken obere und untere Wand
        translate([(schubladenHoehe-steckeckenLaenge)/2, (basisplattenTiefeFuerBesteck-2*wandDicke)])square([steckeckenLaenge, wandDicke]);
        translate([(schubladenHoehe-steckeckenLaenge)/2, -wandDicke])square([steckeckenLaenge, wandDicke]);
      }
      
      //Löcher Steckecken für Trennwände
      if(x >= 0 && x <= 2){
        translate([(basisplattenBreiteFuerBesteck/5)/2-steckeckenLaenge/2, laengeUntereLinkeFaecher])square([steckeckenLaenge, wandDicke]);}
      if(x >= 2 && x <= 5){
        translate([(basisplattenBreiteFuerBesteck/5)/2-steckeckenLaenge/2, laengeUntereRechteFaecher])square([steckeckenLaenge, wandDicke]);
      }

    }
  }
}

//Obere und untere Wand
for(y=[0:1]){
  translate([0, schubladenTiefe + 5 + y*(schubladenHoehe+5)]){
    difference(){
      union(){
        square([schubladenBreite, schubladenHoehe]);
        //Steckecken Boden
        for(i=[(basisplattenBreiteFuerBesteck/5)/2-steckeckenLaenge/2:basisplattenBreiteFuerBesteck/5:basisplattenBreiteFuerBesteck]){
          translate([i, -wandDicke])square([steckeckenLaenge, wandDicke]);
        }
      }
      //Löcher Steckecken Seitenwände
      for(x=[wandDicke:(basisplattenBreiteFuerBesteck-wandDicke)/5:basisplattenBreiteFuerBesteck]){
        translate([x, (schubladenHoehe-steckeckenLaenge)/2])square([wandDicke, steckeckenLaenge]);
      }
    }
  }
}

//Kleine Trennwände
for(x=[0:4]){
  translate([schubladenBreite + 5 + x*((schubladenHoehe + 5)), schubladenTiefe+5]){
    square([trennwandBreite, schubladenHoehe]);
    //Steckecken Seiten
    for(x2=[0:1]){
      translate([-wandDicke/2 + x2*(trennwandBreite+wandDicke/2), (schubladenHoehe-steckeckenLaenge)/2])square([wandDicke/2, steckeckenLaenge]);
    }
    //Steckecken für Boden
    translate([(trennwandBreite-steckeckenLaenge)/2, -wandDicke])square([steckeckenLaenge, wandDicke]);
    
  }
  
  
}