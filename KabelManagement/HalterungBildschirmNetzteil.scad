materialDicke = 2;
hoehe = 35;
breite = 90;
tiefe = 90;
kaltGeraeteSteckerBreite = 30;
kaltGeraeteSteckerhoehe = 25;
kaltGeraeteSteckerAbstandVonGitter = 5;
kaltGeraeteSteckerAbstandVonVordererWand = 15;
kabelAbstandVonGitter=8;
kabelHoehe=hoehe-2*8;
kabelBreite = 40;
kabelAbstandVonLinkerWand=50;
gitterRechteckBreite = (breite-materialDicke*4)/5;
gitterRechteckTiefe = (tiefe-materialDicke*4)/5;
schraubeDurchmesser=2;
schraubeKopfDurchmesser=5;
schraubeToleranz=2;
fn=16;
difference(){
  cube([breite+materialDicke*2, tiefe+materialDicke*2, hoehe+materialDicke]);
  translate([materialDicke,materialDicke,materialDicke])cube([breite, tiefe, hoehe]);
  
  //Gitter
  for(x = [materialDicke:gitterRechteckBreite+materialDicke:breite+materialDicke-gitterRechteckBreite]){
    for(y = [materialDicke:gitterRechteckBreite+materialDicke:breite+materialDicke-gitterRechteckBreite]){
        translate([x,y,0])cube([gitterRechteckBreite,gitterRechteckTiefe,materialDicke]);
    }
  }
  
  //Aussparung KaltgeraeteStecker
  translate([0,kaltGeraeteSteckerAbstandVonVordererWand,materialDicke+kaltGeraeteSteckerAbstandVonGitter])cube([materialDicke,kaltGeraeteSteckerBreite,kaltGeraeteSteckerhoehe]);
  
  //Aussparung Kabel
  translate([kabelAbstandVonLinkerWand+materialDicke,tiefe+materialDicke, kabelAbstandVonGitter+materialDicke])cube([kabelBreite,materialDicke,kabelHoehe]);
}

//SchraubLoecher
translate([-(schraubeKopfDurchmesser+schraubeToleranz)/2,0,hoehe]){
  difference(){
    union(){
      cube([(schraubeKopfDurchmesser+schraubeToleranz)/2,schraubeKopfDurchmesser+schraubeToleranz,materialDicke]);
      translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeKopfDurchmesser+schraubeToleranz, h=materialDicke);
    }
    translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeDurchmesser,h=materialDicke);
  }
}

translate([-(schraubeKopfDurchmesser+schraubeToleranz)/2,tiefe+materialDicke*2-((schraubeKopfDurchmesser+schraubeToleranz)),hoehe]){
  difference(){
    union(){
      cube([(schraubeKopfDurchmesser+schraubeToleranz)/2,schraubeKopfDurchmesser+schraubeToleranz,materialDicke]);
      translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeKopfDurchmesser+schraubeToleranz, h=materialDicke);
    }
    translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeDurchmesser,h=materialDicke);
  }
}

translate([breite+materialDicke*2+(schraubeKopfDurchmesser+schraubeToleranz)/2,schraubeKopfDurchmesser+schraubeToleranz,hoehe]){
  rotate([0,0,180])difference(){
    union(){
      cube([(schraubeKopfDurchmesser+schraubeToleranz)/2,schraubeKopfDurchmesser+schraubeToleranz,materialDicke]);
      translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeKopfDurchmesser+schraubeToleranz, h=materialDicke);
    }
    translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeDurchmesser,h=materialDicke);
  }
}

translate([breite+materialDicke*2+(schraubeKopfDurchmesser+schraubeToleranz)/2,tiefe+materialDicke*2,hoehe]){
  rotate([0,0,180])difference(){
    union(){
      cube([(schraubeKopfDurchmesser+schraubeToleranz)/2,schraubeKopfDurchmesser+schraubeToleranz,materialDicke]);
      translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeKopfDurchmesser+schraubeToleranz, h=materialDicke);
    }
    translate([0,(schraubeKopfDurchmesser+schraubeToleranz)/2,0])cylinder($fn=fn, d=schraubeDurchmesser,h=materialDicke);
  }
}