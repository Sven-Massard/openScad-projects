heightBox=180;
widthBox=180;
lengthBox=280;
thicknessWall=3;
fn=16;
angleToX=atan(85/(lengthBox-2*thicknessWall));
additionalSlopeHeight=2*cos(angleToX);
additionalSlopeLength=2*sin(angleToX);
lengthSlope=sqrt(pow(lengthBox-(2*thicknessWall)+(2*additionalSlopeLength), 2)+pow(85, 2));
widthSlope=widthBox-2*thicknessWall;
heightBetweenGroundAndSlopeMiddle=heightBox-2*thicknessWall-additionalSlopeHeight/2-85;
wallLength=sqrt(pow(lengthSlope/2, 2)+pow(widthSlope/2 - 30, 2));
wallAngle=atan((widthSlope/2 - 30)/(lengthSlope/2));
wallAdditionalLength=2*tan(wallAngle);
photoSensorHeightTranslation=20.25;
echo(heightBetweenGroundAndSlopeMiddle);
echo(wallAngle);

difference(){
  translate([0, 0, heightBetweenGroundAndSlopeMiddle/2 - additionalSlopeHeight/2])union(){
    
    //Querfläche + Seiten
    rotate([0, angleToX, 0])!union(){
      difference(){
        cube([lengthSlope, widthSlope, 2], center=true);
        translate([(lengthSlope-60-30)/2, 0, 0])cylinder($fn=fn, d=60, h=2, center=true);
      }
      translate([(lengthSlope/2 - wallAdditionalLength)/2, 30, 30/2])cube([lengthSlope/2 + wallAdditionalLength, 2, 30], center=true);
      difference(){
          translate([(lengthSlope/2 - wallAdditionalLength)/2, -30, 30/2])cube([lengthSlope/2 + wallAdditionalLength, 2, 30], center=true);
          translate([60, -30-22.2/2+1, photoSensorHeightTranslation])rotate([0, 90, 90])
          //Basiscubus
          translate([0, 0, 0])cube([4.5*2 + 3, 5.1+1, 22.2], center = true);
      }
      translate([-lengthSlope/4, -30/2 - widthSlope/4, 30/2])rotate([0, 0, wallAngle])cube([wallLength, 2, 30], center=true);
      translate([-lengthSlope/4, 30/2 + widthSlope/4, 30/2])rotate([0, 0, -wallAngle])cube([wallLength, 2, 30], center=true);
      
      //Gehaeuse Lichtsensor
      translate([60, -30-22.2/2+1, photoSensorHeightTranslation])rotate([0, 90, 90])difference(){
        union(){
          difference(){
          //Basiscubus
          translate([0, 0, 0])cube([4.5*2 + 3, 5.1+1, 22.2], center = true);
          //Ausschnitt Photoresitor
            translate([-3/2, 0, (22.2-2.2)/2])difference(){
              cylinder($fn = fn, d=5.1, h=2.2, center=true);
              translate([+3/2 + 4.5/2, 0, 0])cube([3, 3, 3], center = true);
              translate([-3/2 - 4.5/2, 0, 0])cube([3, 3, 3], center = true);
            }
      
          }
      }
      //Löcher Beine Lichtsensor. Höhe extra übertrieben, ging nicht anders.
      translate([-3/2,  (4-1)/2, -(22.2-20)/2])cylinder($fn = fn, d=2, h=22, center=true);
      translate([-3/2, -(4-1)/2, -(22.2-20)/2])cylinder($fn = fn, d=2, h=22, center=true);
      }
      //Stützcubus
      translate([60, -30-22.2/2+1, photoSensorHeightTranslation/2 - 2])cube([5.1+1, 22.2, photoSensorHeightTranslation - 6], center = true);
    }
    
    //Abstandhalter zu Boden
    translate([(lengthBox-(2*thicknessWall))/2 - 1, 0, -(heightBetweenGroundAndSlopeMiddle/2 + 85/2)])cube([2, widthBox, heightBetweenGroundAndSlopeMiddle], center=true);
  }



//Box

  difference(){
    cube([lengthBox + 300, widthBox + 300, heightBox + 300], center=true);
    cube([lengthBox-2*thicknessWall, widthBox-2*thicknessWall, heightBox-2*thicknessWall], center=true);
  }
}