heightCylinder=30.5;
heightBoard=3;
fn=128;

difference(){
  union(){
    cylinder($fn=fn, d=67, h=heightBoard, center=true);
    translate([0,0,(heightBoard+heightCylinder)/2])cylinder($fn=fn, d1=67, d2=128, h=heightCylinder, center=true);
  }
  translate([0,0,1])cylinder($fn=fn, d=65, h=5, center=true);
  translate([0,0,2+(heightBoard+heightCylinder)/2])cylinder($fn=fn, d1=67, d2=128, h=heightCylinder, center=true);
}