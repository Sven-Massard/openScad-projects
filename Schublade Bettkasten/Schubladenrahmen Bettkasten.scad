tiefe = 297;
hoehe = 303;
breite = 236;
wandDicke=3;
steckeckenLaenge=20;
steckeckenProSeite=10;
zeichenabstand=wandDicke*3;


seitenwandTiefe=tiefe-wandDicke;
seitenwandHoehe=hoehe;
obereUntereMittlereWandTiefe=tiefe-wandDicke;
obereUntereMittlereWandBreite=breite-2*wandDicke;

//Rückwand
difference(){
  square([hoehe, breite]);
  //Steckeckenlöcher für Seitenwände
  for(x=[hoehe/steckeckenProSeite/2/2:hoehe/steckeckenProSeite:hoehe-hoehe/steckeckenProSeite/2/2]){
    for(y=[0,breite-wandDicke]){
      translate([x, y])square([hoehe/steckeckenProSeite/2, wandDicke]);
    }
  }
  //Steckeckenlöcher für obere, untere und mittlere Wand
  for(x=[0, (hoehe-wandDicke)/2, hoehe-wandDicke]){
    for(y=[breite/steckeckenProSeite/4:breite/steckeckenProSeite:breite-breite/steckeckenProSeite/2/2]){
      translate([x, y])square([wandDicke, breite/steckeckenProSeite/2]);
    }
  }
}

//Seitenwände
for(x=[0:1]){
  translate([hoehe+zeichenabstand+x*(seitenwandHoehe+zeichenabstand), 0]){
    difference(){
      union(){
        square([seitenwandHoehe, seitenwandTiefe]);
        //Steckecken für Rückwand
        for(x=[hoehe/steckeckenProSeite/2/2:hoehe/steckeckenProSeite:hoehe-hoehe/steckeckenProSeite/2/2]){
          translate([x, seitenwandTiefe])square([hoehe/steckeckenProSeite/2, wandDicke]);
        }
      }
      //Steckeckenlöcher obere, untere und mittlere Wand
          //Steckecken für Seitenwände
    for(x=[0, (seitenwandHoehe-wandDicke)/2, seitenwandHoehe-wandDicke]){
      for(y=([obereUntereMittlereWandTiefe/steckeckenProSeite/2/2:obereUntereMittlereWandTiefe/steckeckenProSeite:obereUntereMittlereWandTiefe-obereUntereMittlereWandTiefe/steckeckenProSeite/2/2])){
        translate([x, y])square([wandDicke, obereUntereMittlereWandTiefe/steckeckenProSeite/2]);
      }
    }
    }
  }
}

//Obere, untere und mittlere Wand
for(x=[0:2]){
  translate([hoehe+zeichenabstand+2*(seitenwandHoehe+zeichenabstand)+x*(obereUntereMittlereWandBreite+zeichenabstand), 0]){
    square([obereUntereMittlereWandBreite, obereUntereMittlereWandTiefe]);
    //Steckecken für Rückwand
    for(x=[breite/steckeckenProSeite/2/2-wandDicke:breite/steckeckenProSeite:breite-breite/steckeckenProSeite/2/2]){
      translate([x, obereUntereMittlereWandTiefe])square([breite/steckeckenProSeite/2, wandDicke]);
    }
    //Steckecken für Seitenwände
    for(x=[-wandDicke, obereUntereMittlereWandBreite]){
      for(y=([obereUntereMittlereWandTiefe/steckeckenProSeite/2/2:obereUntereMittlereWandTiefe/steckeckenProSeite:obereUntereMittlereWandTiefe-obereUntereMittlereWandTiefe/steckeckenProSeite/2/2])){
        translate([x, y])square([wandDicke, obereUntereMittlereWandTiefe/steckeckenProSeite/2]);
      }
    }
  }
}

