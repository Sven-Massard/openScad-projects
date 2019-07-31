include <photoresistorCasing2.scad>
include <GehaeuseLaser.scad>
ballDiameter=44;
ballTolerance=6;
ballHoleDistanceFromLeftInnerBoxSide=2;
printWallThickness=2;
boxprintWallThickness=3;
boxXSize=190;
boxYSize=150;
boxHeight=160;
slopeAngle=20;
firstWallAngle=-12;
secondWallAngle=12;
laserCasingLaserBarrelMidpointX=-1;
laserCasingLaserBarrelMidpointZ=0.2;
laserCasingLength=22.19;
photoresistorCasingLength=11.1;
photoresistorCasingOffset=3;
cableHoleDiameter=5;

boxInsideXSize=boxXSize-2*boxprintWallThickness;
boxInsideYSize=boxYSize-2*boxprintWallThickness;
boxInsideHeight=boxHeight-2*boxprintWallThickness;

drawerHeight=ballDiameter+ballTolerance+boxprintWallThickness;
drawerLength=ballDiameter+ballTolerance+2*boxprintWallThickness;

slopeSurfaceDistanceToFloor=drawerHeight;
slopeSurfaceXLength=boxInsideXSize-drawerLength;
slopeSurfaceHeight=slopeSurfaceXLength*tan(slopeAngle);
slopeSurfaceLength=slopeSurfaceXLength/cos(slopeAngle);
slopeSurfaceDistanceToCeiling=boxHeight-slopeSurfaceHeight-drawerHeight;

holeDiameter=2*printWallThickness+ballDiameter+ballTolerance;
holeDistanceRightEdgeToLeftEdgeOfInnerBox=ballHoleDistanceFromLeftInnerBoxSide+(holeDiameter);
holeDistanceRightEdgeToSlopeSurface=slopeSurfaceDistanceToCeiling+holeDistanceRightEdgeToLeftEdgeOfInnerBox*tan(slopeAngle);

echo("Distance Hole Edge to Slope Surface: ", holeDistanceRightEdgeToSlopeSurface);
if (holeDistanceRightEdgeToSlopeSurface<ballDiameter+ballTolerance) echo("<font color='red'>HOLE FOR BALL IN BOX TOO CLOSE TO EDGE!</font>");
if (slopeSurfaceDistanceToCeiling <= 0) echo("<font color='red'>CRITICAL VARIABLE ZERO OR NEGATIVE! THIS SHOULD NOT HAPPEN!</font>");
  
module slope(){
  
  //Variables
  pointBallHits=(-(boxInsideXSize/2)+ballHoleDistanceFromLeftInnerBoxSide+(holeDiameter/2)+drawerLength/2)/cos(slopeAngle);
  
  //Variables First Wall
  firstWallLength=(boxInsideYSize-(ballDiameter+ballTolerance))/cos(firstWallAngle);
  firstWallXDistance=firstWallLength*sin(abs(firstWallAngle));
  firstWallXOffSet=pointBallHits+(ballDiameter+ballTolerance)/2;
  firstWallYOffSet=-boxInsideYSize/2+(boxInsideYSize-(ballDiameter+ballTolerance))/2;
  
  //Variables Second Wall
  secondWallLength=(boxInsideYSize-(ballDiameter+ballTolerance))/cos(secondWallAngle);
  secondWallXDistance=secondWallLength*sin(secondWallAngle);
  secondWallXOffSet=firstWallXOffSet+(ballDiameter+ballTolerance)/cos(abs(secondWallAngle))+(firstWallXDistance+secondWallXDistance)/2-(-firstWallYOffSet*2*tan(secondWallAngle));
  secondWallYOffSet=-firstWallYOffSet;

  
  //Variables Third Wall
  thirdWallAngle=secondWallAngle;
  thirdWallLength=secondWallLength;
  thirdWallXOffSet=firstWallXOffSet+firstWallLength*sin(abs(firstWallAngle))/2+thirdWallLength*sin(abs(thirdWallAngle))/2;
  thirdWallYOffSet=firstWallYOffSet;
  
  //Variables Photoresistor Casing
  photoresistorCasingXOffSet=thirdWallXOffSet+(-photoresistorCasingLength/2)*cos(abs(thirdWallAngle))+(printWallThickness/2)*cos(abs(thirdWallAngle))-photoresistorCasingOffset*sin(abs(thirdWallAngle));
  photoresistorCasingYOffSet=thirdWallYOffSet+(-photoresistorCasingLength/2)*sin(thirdWallAngle)+(printWallThickness/2)*sin(thirdWallAngle)+photoresistorCasingOffset*cos(thirdWallAngle);
  
  
  //Variables Laser Casing
  distanceSecondToThirdWallXCoordinate=secondWallXDistance-thirdWallXOffSet;
  distanceSecondToThirdWallYCoordinate=secondWallYOffSet-thirdWallYOffSet;
  laserCasingXOffSet=photoresistorCasingXOffSet+distanceSecondToThirdWallYCoordinate+(laserCasingLength/2)*cos(secondWallAngle)-laserCasingLaserBarrelMidpointX*sin(secondWallAngle);
  laserCasingYOffSet=photoresistorCasingYOffSet+distanceSecondToThirdWallXCoordinate+(laserCasingLength/2)*sin(secondWallAngle)+laserCasingLaserBarrelMidpointX*cos(secondWallAngle);
  
  //Variables cable Hole Photo Resistor
  cableHolePhotoresistorXOffset=(firstWallXOffSet+thirdWallXOffSet)/2;
  cableHolePhotoresistorYOffset=-(boxInsideYSize/2-15);
  
  //Variables Hole Laser Casing
  cableHoleLaserXOffset=secondWallXOffSet+(secondWallLength*sin(abs(secondWallAngle))/2);
  cableHoleLaserYOffset=(boxInsideYSize/2-15);
  
  difference(){
    //Slope
    cube([slopeSurfaceLength, boxInsideYSize, printWallThickness], center=true);
    
    //Cable Hole Photo Resistor
    translate([cableHolePhotoresistorXOffset, cableHolePhotoresistorYOffset, 0])cylinder(d=cableHoleDiameter, h=printWallThickness, center=true);
    
    //Cable Hole Laser
    translate([cableHoleLaserXOffset, cableHoleLaserYOffset, 0])cylinder(d=cableHoleDiameter, h=printWallThickness, center=true);
  }
    
  //First Wall
  translate([firstWallXOffSet, firstWallYOffSet, ballDiameter/2])rotate([0, 0, firstWallAngle])cube([printWallThickness, firstWallLength, ballDiameter], center=true);
  
  //Second Wall
  difference(){
    translate([secondWallXOffSet, secondWallYOffSet, ballDiameter/2])rotate([0, 0, secondWallAngle])cube([printWallThickness, secondWallLength, ballDiameter], center=true);
    translate([laserCasingXOffSet, laserCasingYOffSet, ballDiameter/2 - laserCasingLaserBarrelMidpointZ])rotate([0,0,secondWallAngle+90])cube([19.5, 35, 13], center=true);
  }
  
  //ThirdWall
  difference(){
    translate([thirdWallXOffSet, thirdWallYOffSet, ballDiameter/2])rotate([0, 0, thirdWallAngle])cube([printWallThickness, thirdWallLength, ballDiameter], center=true);

  //Hole for photoresistor casing. Length + 1 because cutoff didn't work right.
    translate([photoresistorCasingXOffSet, photoresistorCasingYOffSet, ballDiameter/2])rotate([0,0,thirdWallAngle])cube([photoresistorCasingLength+1, 5.5+1, 5.5+1], center = true);
  }
  
  //Laser casing
  translate([laserCasingXOffSet, laserCasingYOffSet, ballDiameter/2 - laserCasingLaserBarrelMidpointZ])rotate([0,0,secondWallAngle+90])laserCasing();
  
  //photoresistor Casing
  translate([photoresistorCasingXOffSet, photoresistorCasingYOffSet, ballDiameter/2])rotate([0,0,thirdWallAngle])photoresistorCasing();
  
//  //Test Ball 1
//  translate([firstWallXOffSet+firstWallLength*sin(abs(firstWallAngle))/2, boxInsideYSize/2-(ballDiameter+ballTolerance)/2, (ballDiameter+ballTolerance)/2 + printWallThickness/2])sphere(d=(ballDiameter+ballTolerance), center=true);
//  
//  //Test Ball 2
//  translate([pointBallHits, 0, (ballDiameter+ballTolerance)/2 + printWallThickness/2])sphere(d=(ballDiameter+ballTolerance), center=true);
//  
//  //Test Ball 3
//  translate([28, 0, (ballDiameter+ballTolerance)/2 + printWallThickness/2])sphere(d=(ballDiameter+ballTolerance), center=true);
  
  
}

module drawerWall(){
  cube([printWallThickness, boxInsideYSize, drawerHeight], center=true);
}

module leftWall(){
  cube([printWallThickness, boxInsideYSize, drawerHeight+slopeSurfaceHeight], center=true);
}
//Start of Rendering

difference(){
  union(){
    //Slope
    slopeZThickness=((printWallThickness/2)*cos(slopeAngle));
    slopeXDelta=(printWallThickness/2)*sin(slopeAngle); //How much to move slope to left due to thickness of print
    
    translate([boxInsideXSize/2-drawerLength-slopeXDelta-slopeSurfaceXLength/2, 0, -boxInsideHeight/2+drawerHeight+slopeSurfaceHeight/2-slopeZThickness])rotate([0, slopeAngle, 0])slope();
    
    //Left Wall
    
    translate([-boxInsideXSize/2+printWallThickness/2, 0, -boxInsideHeight/2+(drawerHeight+slopeSurfaceHeight)/2-slopeZThickness])leftWall();
    
    //Drawer Wall
    translate([boxInsideXSize/2-drawerLength-printWallThickness/2, 0, -boxInsideHeight/2+drawerHeight/2])drawerWall();
    
  }
    
  
  //Box as cutoff  
  difference(){
    cube([boxXSize, boxYSize, boxHeight], center=true);
    cube([boxInsideXSize, boxInsideYSize, boxInsideHeight], center=true);
  }
}