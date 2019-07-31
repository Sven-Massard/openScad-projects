schubladenTiefe = 455;
schubladenBreite= 295;
schubladenHoehe=60;
wandDicke=3;
steckeckenLaenge=20;
zwischenwandTiefe=schubladenTiefe-2*wandDicke;
trennwandBreite=(schubladenBreite-wandDicke*6)/5;

difference(){
//Basisplatte
  square([schubladenBreite, schubladenTiefe]);
  //Löcher für Steckecken Zwischenwände
  translate([0, wandDicke])for(x=[0:(schubladenBreite-wandDicke)/5:schubladenBreite-wandDicke]){
    for(y=[0: (zwischenwandTiefe-steckeckenLaenge)/10: zwischenwandTiefe]){
      translate([x, y])square([wandDicke, steckeckenLaenge]);
    }
  }
  
  //Löcher für Steckecken obere und unter Wand
  for(y=[0,schubladenTiefe-wandDicke]){
    translate([0, wandDicke+y]){
      for(x=[(schubladenBreite/5)/2-steckeckenLaenge/2:schubladenBreite/5:schubladenBreite]){
        translate([x, -wandDicke])square([steckeckenLaenge, wandDicke]);
      }
    }
  }
  //Löcher Steckecken für Trennwände
  for(x=[(schubladenBreite/5)/2-steckeckenLaenge/2:schubladenBreite/5:schubladenBreite]){
    for(y=[100: (schubladenTiefe-200)/4 : schubladenTiefe-100]){
      translate([x, y])square([steckeckenLaenge, wandDicke]);
    }
  }
}

//Zwischenwände
translate([0, wandDicke])for(x=[0:5]){
  translate([schubladenBreite + 5*(x+1) + schubladenHoehe*x, 0]){
    difference(){
      union(){
        square([schubladenHoehe, zwischenwandTiefe]);
        //Steckecken zu GrundPlatte
        for(y=[0: (zwischenwandTiefe-steckeckenLaenge)/10: zwischenwandTiefe]){
          translate([-wandDicke, y])square([wandDicke, steckeckenLaenge]);
        }
        //Steckecken obere und untere Wand
        translate([(schubladenHoehe-steckeckenLaenge)/2, (schubladenTiefe-2*wandDicke)])square([steckeckenLaenge, wandDicke]);
        translate([(schubladenHoehe-steckeckenLaenge)/2, -wandDicke])square([steckeckenLaenge, wandDicke]);
      }
      
      //Löcher Steckecken für Trennwände
      for(x=[(schubladenBreite/5)/2-steckeckenLaenge/2:schubladenBreite/5:schubladenBreite]){
        for(y=[100: (schubladenTiefe-200)/4 : schubladenTiefe-100]){
          translate([x, y-wandDicke])square([steckeckenLaenge, wandDicke]);
        }
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
        for(i=[(schubladenBreite/5)/2-steckeckenLaenge/2:schubladenBreite/5:schubladenBreite]){
          translate([i, -wandDicke])square([steckeckenLaenge, wandDicke]);
        }
      }
      //Löcher Steckecken Seitenwände
      for(x=[0:(schubladenBreite-wandDicke)/5:schubladenBreite-wandDicke]){
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