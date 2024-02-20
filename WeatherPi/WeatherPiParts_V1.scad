// ========================================
// Weather Pi case
// Version 1
// (c) Ralf Lange, longsoft.de
// ========================================

// Include the constants with the dimensions
// and the special variables
include <WeatherPiConstants_V1.scad>;
include <../raspberry/PiPcbConstants.scad>
// include <raspberry/Pi3Constants.scad>;
include <../raspberry/PiPartConstants.scad>
include <../parts/Display7Constants.scad>;

use <../parts/CaseParts.scad>
use <../parts/Parts.scad>
use <../parts/Display7Board.scad>
use <../raspberry/Pi3Boards.scad>
use <../raspberry/PiOpenings.scad>
use <../raspberry/PiParts.scad>
// use <parts/Modules.scad>
use <../hat/PiSense.scad>

// Which one would you like to see?
displayBucket = false;
displayHopper = false;
displayChassis = false;       // Chassis part of the case
displayAll = true;           // All parts together
displayImage = false;         // All parts together in one image

displayDevices = false;
withThread = false;

// Details of the drawing (larger is better)
$fn=100;
transparency = 0.5;  // 1.0 is opace

// Rasberry Pi printed ciruits board position
raspiOffsetX = -30;
raspiOffsetY = 0;

module prism(width, depth, hight, center = false)
{
  CubePoints = [
    [ 0, 0, 0 ],                    //0
    [ width, 0, 0 ],                //1
    [ width, depth, 0 ],            //2
    [ 0, depth, 0 ],                //3
    [ width/2-0.1, 0, hight ],      //4
    [ width/2+0.1, 0, hight ],      //5
    [ width/2+0.1, depth, hight ],  //6
    [ width/2-0.1, depth, hight ]   //7
  ];
  
  CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]   // left
  ];
  
  if (center == true) {
    translate([ -width/2, -depth/2, -hight/2])
      polyhedron( CubePoints, CubeFaces );
  }
  else {
    polyhedron( CubePoints, CubeFaces );
  }
}

module tippingBucket()
{
  prismWidth = 10;
  socketHeight = 7;
  
  // translate([-50, 59, 0])
  //   import("files/WatherTipper.stl", convexity=3);
  
  color("lightblue") {
  translate([ 0, 0, 0]) {
    translate([ 0, 0,-bucketT-bucketPivotR/2])
      cube([ bucketW, bucketD+bucketT*2, bucketT], center=true);
    translate([-prismWidth/2,-bucketD/2,-bucketT-bucketPivotR/2])
      prism( prismWidth, bucketD, bucketH);

    translate([-bucketW/2, bucketD/2,-bucketT/2-bucketPivotR/2])
      cube([ bucketW, bucketT, socketHeight]);
    translate([-bucketW/2, bucketD/2, socketHeight-bucketT/2-bucketPivotR/2])
      prism( bucketW, bucketT, bucketH-socketHeight-bucketT/2);

    translate([-bucketW/2,-bucketD/2-bucketT,-bucketT/2-bucketPivotR/2])
      cube([ bucketW, bucketT, socketHeight]);
    translate([-bucketW/2,-bucketD/2-bucketT, socketHeight-bucketT/2-bucketPivotR/2])
      prism( bucketW, bucketT, bucketH-socketHeight-bucketT/2);

    translate([ 0, 0, 0])
      rotate([ 0, 90, 90])
        cylinder(h=bucketPivotD, r=bucketPivotR, center=true);
  }
  }
}

module caseHopper(withDevices = false)
{
  backR = 10;
  
  // Hopper
  difference() {
    // Outer hull
    color("silver") {
      hull() {
        translate([ hopperW/2-caseR, hopperD/2-caseR,0]) {
          translate([0,0,(hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([0,0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        translate([ hopperW/2-caseR,-hopperD/2+caseR,0]) {
          translate([0,0,(hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([0,0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        translate([-hopperW/2+caseR,-hopperD/2+caseR,0]) {
          translate([0,0,(hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([0,0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        translate([-hopperW/2+caseR, hopperD/2-caseR,0]) {
          translate([0,0,(hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([0,0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        
        translate([sinkOffsetX+10, 5, hopperH-backR])
          sphere(r = backR);
        translate([sinkOffsetX+10,-5, hopperH-backR])
          sphere(r = backR);
        translate([sinkOffsetX-10,-5, hopperH-backR])
          sphere(r = backR);
        translate([sinkOffsetX-10, 5, hopperH-backR])
          sphere(r = backR);
      }
      
      // Opening for sink
      translate([sinkOffsetX, 0, hopperH+caseT])
        cube([ sinkW+sinkT*2, sinkD+sinkT*2, sinkH], center=true);
    }
    
    // Inner hull
    translate([0,0,-caseT/2-0.05]) {
      color("silver") {
        hull() {
          translate([ hopperW/2-caseR, hopperD/2-caseR,0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([ hopperW/2-caseR,-hopperD/2+caseR,0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([-hopperW/2+caseR,-hopperD/2+caseR,0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([-hopperW/2+caseR, hopperD/2-caseR,0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([sinkOffsetX+10, 5, hopperH-backR-caseT])
            sphere(r = backR);
          translate([sinkOffsetX+10,-5, hopperH-backR-caseT])
            sphere(r = backR);
          translate([sinkOffsetX-10,-5, hopperH-backR-caseT])
            sphere(r = backR);
          translate([sinkOffsetX-10, 5, hopperH-backR-caseT])
            sphere(r = backR);
        }
        
        // Opening for sink
        translate([sinkOffsetX, 0, hopperH+caseT])
          cube([ sinkW, sinkD, sinkH*2], center=true);
      }
    }
  }
  
  // Case part
  translate([caseOffsetX, 0, hopperCaseOffsetZ]) {
    if (withDevices) {
      // Raspberry 3+
      raspiOffsetZ = 130;
      translate([ raspiOffsetX, raspiOffsetY, raspiOffsetZ])
        rotate([ 0, -90, 0])
          pi3Bplus();
    }

    color("silver", transparency) {
      difference() {
        // Outer hull
        hull() {
          translate([ caseW/2-caseR, caseD/2-caseR,0])
            cylinder(h=hopperCaseH, r=caseR, center=true);
          translate([ caseW/2-caseR,-caseD/2+caseR,0])
            cylinder(h=hopperCaseH, r=caseR, center=true);
          translate([-caseW/2+caseR,-caseD/2+caseR,0])
            cylinder(h=hopperCaseH, r=caseR, center=true);
          translate([-caseW/2+caseR, caseD/2-caseR,0])
            cylinder(h=hopperCaseH, r=caseR, center=true);
        }
    
        // Inner hull
        hull() {
          translate([ caseW/2-caseR, caseD/2-caseR,0])
            cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
          translate([ caseW/2-caseR,-caseD/2+caseR,0])
            cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
          translate([-caseW/2+caseR,-caseD/2+caseR,0])
            cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
          translate([-caseW/2+caseR, caseD/2-caseR,0])
            cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
        }
      }
      
      // Case threaded sleeves
      sleeveH = hopperCaseH-caseT*2;
      translate([ 0, 0, caseHopperH-hopperCaseOffsetZ-sleeveH/2]) {
        translate([ caseW/2-case7BushX, caseD/2-case7BushY,0])
          threadedSleeveCorner(false, sleeveH, case7BushD, case7BushB, sleeveH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
        translate([ caseW/2-case7BushX,-caseD/2+case7BushY,0])
          rotate([0,0,-90])
            threadedSleeveCorner(false, sleeveH, case7BushD, case7BushB, sleeveH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
        translate([-caseW/2+case7BushX,-caseD/2+case7BushY,0])
          rotate([0,0,180])
            threadedSleeveCorner(false, sleeveH, case7BushD, case7BushB, sleeveH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
        translate([-caseW/2+case7BushX, caseD/2-case7BushY,0])
          rotate([0,0,90])
            threadedSleeveCorner(false, sleeveH, case7BushD, case7BushB, sleeveH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
      }
    }
  }
  
  // Case border
  translate([caseOffsetX, 0, caseHopperH]) {
    color("silver", transparency) {
      translate([ 0, 0, 0]) {
        difference() {
          // Outer hull
          hull() {
            translate([ caseW/2-caseR*0.75, caseD/2-caseR*0.75, 0])
              cylinder(h=caseBorderH, r=caseR, center=true);
            translate([ caseW/2-caseR*0.75,-caseD/2+caseR*0.75, 0])
              cylinder(h=caseBorderH, r=caseR, center=true);
            translate([-caseW/2+caseR*0.75,-caseD/2+caseR*0.75, 0])
              cylinder(h=caseBorderH, r=caseR, center=true);
            translate([-caseW/2+caseR*0.75, caseD/2-caseR*0.75, 0])
              cylinder(h=caseBorderH, r=caseR, center=true);
          }
          
          // Inner hull
          hull() {
            translate([ caseW/2-caseR*0.75, caseD/2-caseR*0.75, 0])
              cylinder(h=caseBorderH+0.1, r=caseR-caseT, center=true);
            translate([ caseW/2-caseR*0.75,-caseD/2+caseR*0.75, 0])
              cylinder(h=caseBorderH+0.1, r=caseR-caseT, center=true);
            translate([-caseW/2+caseR*0.75,-caseD/2+caseR*0.75, 0])
              cylinder(h=caseBorderH+0.1, r=caseR-caseT, center=true);
            translate([-caseW/2+caseR*0.75, caseD/2-caseR*0.75, 0])
              cylinder(h=caseBorderH+0.1, r=caseR-caseT, center=true);
          }
        }
      }
    }
  }
}

module caseChassis(withDevices = false)
{
  cableOffsetY = 19;
  chassisOpeningZ = 10;

  translate([caseOffsetX, 0, caseChassisH/2]) {
    
    if (withDevices) {
      // Raspberry 3+
      raspiOffsetZ = 42;
      translate([ raspiOffsetX, raspiOffsetY, raspiOffsetZ])
        rotate([ 0, 90, 180])
          pi3Bplus();
      
      hatOffsetX = raspiOffsetX - 13;
      hatOffsetY = raspiOffsetY;
      
      // PiSense HAT
      piusvOffsetZ = raspiOffsetZ + 10;
      translate([ hatOffsetX, hatOffsetY, piusvOffsetZ])
        rotate([ 0, 90, 180])
          piSense();
      
      translate([ sinkOffsetX-caseOffsetX, 0, bucketOffsetZ])
        rotate([ 0, 0 /* 23.8 */, 90])
          tippingBucket();
    }
    
    color("silver", transparency)
    difference() {
      // Outer hull
      hull() {
        translate([ caseW/2-caseR, caseD/2-caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
        translate([ caseW/2-caseR,-caseD/2+caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
        translate([-caseW/2+caseR,-caseD/2+caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
        translate([-caseW/2+caseR, caseD/2-caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
      }
      
      // Inner hull
      translate([0,0,chassisT-chassisT/2+0.05]) {
        hull() {
          translate([ caseW/2-caseR, caseD/2-caseR,0])
            cylinder(h=caseChassisH-chassisT+0.1, r=caseR-caseT, center=true);
          translate([ caseW/2-caseR,-caseD/2+caseR,0])
            cylinder(h=caseChassisH-chassisT+0.1, r=caseR-caseT, center=true);
          translate([-caseW/2+caseR,-caseD/2+caseR,0])
            cylinder(h=caseChassisH-chassisT+0.1, r=caseR-caseT, center=true);
          translate([-caseW/2+caseR, caseD/2-caseR,0])
            cylinder(h=caseChassisH-chassisT+0.1, r=caseR-caseT, center=true);
        }
      }
      
      openingD = 5;
      openingW = 35;
      openingOffsetD = caseT*1.5+openingD/2;
      translate([25, 0,-caseChassisH/2+caseT/2-0.05]) {
        translate([ 0, caseD/2-openingOffsetD, 0]) {
          opening( openingW, openingD, caseT);
        }
        translate([ 0, caseD/2-openingOffsetD*2, 0]) {
          opening( openingW, openingD, caseT);
        }
        translate([ 0, caseD/2-openingOffsetD*3, 0]) {
          opening( openingW, openingD, caseT);
        }
        
        translate([ 0,-caseD/2+openingOffsetD*3, 0]) {
          opening( openingW, openingD, caseT);
        }
        translate([ 0,-caseD/2+openingOffsetD*2, 0]) {
          opening( openingW, openingD, caseT);
        }
        translate([ 0,-caseD/2+openingOffsetD, 0]) {
          opening( openingW, openingD, caseT);
        }
      }
      /*
      chassisOpeningZ = -caseChassisH/2+chassisT/2;
      chassisOffsetZ = chassisOpeningZ+0.2;
      // Opening for touch display HDMI ans USB cable
      translate([-caseW/2+6,cableOffsetY,chassisOpeningZ]) {
        hull() {
          translate([ 0, 26, 0])
            cylinder(h=chassisT+0.1, r=caseT, center=true);
          translate([ 0,-26, 0])
            cylinder(h=chassisT+0.1, r=caseT, center=true);
          translate([25, 26, 0])
            cylinder(h=chassisT+0.1, r=caseT, center=true);
          translate([25,-26, 0])
            cylinder(h=chassisT+0.1, r=caseT, center=true);
        }
      }
  
      // Boreholes for fixing display screws
      translate([displayOffsetX,displayOffsetY,chassisOffsetZ]) {
        translate([ display7HoleX/2, display7HoleY/2,0])
          cylinder(h=chassisT+0.1, d=display7HoleD, center=true);
        translate([ display7HoleX/2,-display7HoleY/2,0])
          cylinder(h=chassisT+0.1, d=display7HoleD, center=true);
        translate([-display7HoleX/2,-display7HoleY/2,0])
          cylinder(h=chassisT+0.1, d=display7HoleD, center=true);
        translate([-display7HoleX/2,+display7HoleY/2,0])
          cylinder(h=chassisT+0.1, d=display7HoleD, center=true);
      }
  
      // Opening and boreholes for Raspberry Pi
      translate([raspiOffsetX,raspiOffsetY,chassisOffsetZ-0.2])
        rotate([0,0,180]) {
          pi3bOpening(chassisT);
        }
  
      // Boreholes for case threaded sleeves
      translate([0,0,chassisOffsetZ]) {
        translate([ caseW/2-case7BushX, caseD/2-case7BushY,0])
          cylinder(h=chassisT+0.2, d=case7BushB, center=true);
        translate([ caseW/2-case7BushX,-caseD/2+case7BushY,0])
          cylinder(h=chassisT+0.2, d=case7BushB, center=true);
        translate([-caseW/2+case7BushX,-caseD/2+case7BushY,0])
          cylinder(h=chassisT+0.2, d=case7BushB, center=true);
        translate([-caseW/2+case7BushX, caseD/2-case7BushY,0])
          cylinder(h=chassisT+0.2, d=case7BushB, center=true);
      }
  
      // Additional openings
      // Quadreant I:
      translate([45, 34,chassisOpeningZ]) {
        opening(56, 38, caseT);
      }
      translate([85, 30.5,chassisOpeningZ]) {
        opening(15, 31, caseT);
      }
  
      // Quadrant II:
  
      // Quadrant III:
      translate([-40,-34.5,chassisOpeningZ]) {
        opening(36, 41, caseT);
      }
      translate([-77,-32,chassisOpeningZ]) {
        opening(26, 36, caseT);
      }
      translate([-40,0,chassisOpeningZ]) {
        opening(36, 20, caseT);
      }
  
      // Quadrant IV: Accumulator
      translate([-23, 23,chassisOpeningZ]) {
        opening(70, 16, caseT);
      }
      translate([-23, 45,chassisOpeningZ]) {
        opening(70, 16, caseT);
      }
      */
    }
    dividerD = 80;
    dividerH = 72;
    dividerOffsetX = raspiOffsetX + 5;
    translate([ dividerOffsetX, 0, 0]) {
      cube([ caseT, caseD-caseT*2, caseChassisH], center=true);
      translate([ 0, 0, dividerH/2+caseChassisH/2])
        cube([ caseT, dividerD, dividerH], center=true);
    }
    
    // Case threaded sleeves
    translate([ caseW/2-case7BushX, caseD/2-case7BushY,0])
      threadedSleeveCorner(false, caseChassisH, case7BushD, case7BushB, caseChassisH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
    translate([ caseW/2-case7BushX,-caseD/2+case7BushY,0])
      rotate([0,0,-90])
        threadedSleeveCorner(false, caseChassisH, case7BushD, case7BushB, caseChassisH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
    translate([-caseW/2+case7BushX,-caseD/2+case7BushY,0])
      rotate([0,0,180])
        threadedSleeveCorner(false, caseChassisH, case7BushD, case7BushB, caseChassisH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
    translate([-caseW/2+case7BushX, caseD/2-case7BushY,0])
      rotate([0,0,90])
        threadedSleeveCorner(false, caseChassisH, case7BushD, case7BushB, caseChassisH, caseR-caseT, case7BushX-caseT, case7BushY-caseT);
  }
}

// ==============================================================================================

if (displayBucket) {
  tippingBucket();
}
if (displayHopper) {
  caseHopper(displayDevices);
}
if (displayChassis) {
  caseChassis(displayDevices);
}
if (displayAll) {
  hopperOffsetZ = 160;
  
  if (!displayDevices) {
    translate([ sinkOffsetX, 0, caseChassisH/2+bucketOffsetZ])
      rotate([ 0, 0, 90])
        tippingBucket();
  }
  
  translate([ 0, 0, 0])
    rotate([ 0, 0, 0])
      caseChassis(displayDevices);

  translate([ 0, 0, caseChassisH+caseHopperH])
    rotate([ 180, 0, 0])
      caseHopper(false);
}
if (displayImage) {
  translate([(caseD+10),0,0])
    rotate([0,0,90])
      case7back(false);

  translate([0,0,0])
    rotate([0,0,90])
      case7chassis(false);
}
