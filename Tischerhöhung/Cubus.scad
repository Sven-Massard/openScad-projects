height = 40;
width = 50;
screwHoleOffset = 15;
fn = 128;
senkeSchraubeTiefe = 5;
durchmesserSchraube = 4;
difference(){
  cube([width,width,height], center = true);
  
  //Schraubenlöcher
  for(x = [-screwHoleOffset, screwHoleOffset]){
    for(y = [-screwHoleOffset, screwHoleOffset]){
      translate([x,y,0])cylinder($fn=fn, d=durchmesserSchraube, h= height, center=true);
    }
  }
  //Senkköpfe oben
  for(x = [-screwHoleOffset, screwHoleOffset]){
    for(y = [-screwHoleOffset, screwHoleOffset]){
      translate([x,y,height/2-senkeSchraubeTiefe/2])cylinder($fn=fn, d1=durchmesserSchraube, d2=senkeSchraubeTiefe*2+durchmesserSchraube, h=senkeSchraubeTiefe, center=true);
    }
  }
    //Senkköpfe unten
  for(x = [-screwHoleOffset, screwHoleOffset]){
    for(y = [-screwHoleOffset, screwHoleOffset]){
      translate([x,y,-height/2+senkeSchraubeTiefe/2])cylinder($fn=fn, d2=durchmesserSchraube, d1=senkeSchraubeTiefe*2+durchmesserSchraube, h=senkeSchraubeTiefe, center=true);
    }
  }
}