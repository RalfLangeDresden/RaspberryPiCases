// ========================================
// Weather Pi case
// Version 2
// (c) Ralf Lange, longsoft.de
// ========================================

// Include the constants with the dimensions
// and the special variables

include <WeatherPiConstants_V2.scad>;
include <../parts/GeometricConstants.scad>;

use <../parts/CaseParts.scad>
use <../parts/Parts.scad>
use <../parts/Geometrics.scad>
use <../parts/Display7Board.scad>
use <../raspberry/Pi3Boards.scad>
use <../raspberry/PiOpenings.scad>
use <../raspberry/PiParts.scad>
// use <parts/Modules.scad>
use <../hat/PiSense.scad>

// Which one would you like to see?
displayBallBearing = false;
displayBucket = false;
displayHopper = false;
displayChassis = false;       // Chassis part of the case
displayAll = true;           // All parts together
displayImage = false;         // All parts together in one image

displayDevices = true;
withThread = false;

// Details of the drawing (larger is better)
$fn = 100;
transparency = 0.5;  // 1.0 is opace

module tippingBucket()
{
  prismWidth = 10;
  socketHeight = 7;
  
  // translate([-50, 59, 0])
  //   import("files/WatherTipper.stl", convexity=3);
  
  color("lightblue") {
    translate([ 0, 0, 0]) {
      translate([ 0, 0,-bucketT-bucketPivotR/2])
        cube([ bucketW, bucketD, bucketT], center=true);
      translate([ 0, 0, bucketH/2-bucketT-bucketPivotR/2])
        prism( prismWidth, bucketD, bucketH, 0.1, true);
      
      prismH = bucketH-socketHeight-bucketT/2;
      
      translate([ 0, (bucketD-bucketT)/2, (socketHeight-bucketT-bucketPivotR)/2])
        cube([ bucketW, bucketT, socketHeight], center=true);
      translate([ 0, (bucketD-bucketT)/2, prismH/2+socketHeight-bucketT/2-bucketPivotR/2])
        prism( bucketW, bucketT, prismH, 0.1, true);
      
      translate([ 0,-(bucketD-bucketT)/2, (socketHeight-bucketT-bucketPivotR)/2])
        cube([ bucketW, bucketT, socketHeight], center=true);
      translate([ 0,-(bucketD-bucketT)/2, prismH/2+socketHeight-bucketT/2-bucketPivotR/2])
        prism( bucketW, bucketT, prismH, 0.1, true);
      
      translate([ 0, 0, 0])
        rotate([ 0, 90, 90])
          cylinder(h=bucketPivotD, r=bucketPivotR, center=true);
    }
  }
}

module caseHopper(withDevices = false)
{
  backR = 10;
  
  if (withDevices) {
    translate([ caseOffsetX, 0, caseH]) {
      // Raspberry 3+
      translate([ raspiOffsetX, raspiOffsetY, -raspiOffsetZ])
        rotate([ 0, -90, 0])
          pi3Bplus();
    }
  }
  
  difference() {
    color("silver", transparency) {
      // Hopper outer hull
      hull() {
        translate([ hopperW/2-caseR, hopperD/2-caseR, 0]) {
          translate([ 0, 0, (hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([ 0, 0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        translate([ hopperW/2-caseR,-hopperD/2+caseR, 0]) {
          translate([ 0, 0, (hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([ 0, 0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        translate([-hopperW/2+caseR,-hopperD/2+caseR, 0]) {
          translate([ 0, 0, (hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([ 0, 0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        translate([-hopperW/2+caseR, hopperD/2-caseR, 0]) {
          translate([ 0, 0, (hopperFrameH-caseT)/2])
            donut(caseR, caseR-caseT);
          translate([ 0, 0,-caseT/2])
            cylinder(h=hopperFrameH-caseT, r=caseR, center=true);
        }
        
        translate([ 5, 2, hopperH-backR])
          sphere(r = backR);
        translate([ 5,-2, hopperH-backR])
          sphere(r = backR);
        translate([-5,-2, hopperH-backR])
          sphere(r = backR);
        translate([-5, 2, hopperH-backR])
          sphere(r = backR);
      }
      
      // Cube for sink
      translate([ 0, 0, hopperH+caseT])
        cube([ sinkW+sinkT*2, sinkD+sinkT*2, sinkH], center=true);
      
      // Case part
      translate([ caseOffsetX, 0, hopperCaseOffsetZ]) {
        color("silver", transparency) {
          difference() {
            // Outer hull
            hull() {
              translate([ caseW/2-caseR, caseD/2-caseR, 0])
                cylinder(h=hopperCaseH, r=caseR, center=true);
              translate([ caseW/2-caseR,-caseD/2+caseR, 0])
                cylinder(h=hopperCaseH, r=caseR, center=true);
              translate([-caseW/2+caseR,-caseD/2+caseR, 0])
                cylinder(h=hopperCaseH, r=caseR, center=true);
              translate([-caseW/2+caseR, caseD/2-caseR, 0])
                cylinder(h=hopperCaseH, r=caseR, center=true);
            }
        
            // Inner hull
            hull() {
              translate([ caseW/2-caseR, caseD/2-caseR, 0])
                cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
              translate([ caseW/2-caseR,-caseD/2+caseR, 0])
                cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
              translate([-caseW/2+caseR,-caseD/2+caseR, 0])
                cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
              translate([-caseW/2+caseR, caseD/2-caseR, 0])
                cylinder(h=hopperCaseH+0.1, r=caseR-caseT, center=true);
            }
          }
          
          // Case threaded sleeves
          sleeveH = hopperCaseH-caseT*2;
          translate([ 0, 0, caseHopperH-hopperCaseOffsetZ-sleeveH/2]) {
            translate([ caseW/2-caseSleeveX, caseD/2-caseSleeveY, 0])
              threadedSleeveCorner(false, sleeveH, caseSleeveD, caseSleeveB, sleeveH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
            translate([ caseW/2-caseSleeveX,-caseD/2+caseSleeveY, 0])
              rotate([ 0, 0,-90])
                threadedSleeveCorner(false, sleeveH, caseSleeveD, caseSleeveB, sleeveH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
            translate([-caseW/2+caseSleeveX,-caseD/2+caseSleeveY, 0])
              rotate([ 0 ,0, 180])
                threadedSleeveCorner(false, sleeveH, caseSleeveD, caseSleeveB, sleeveH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
            translate([-caseW/2+caseSleeveX, caseD/2-caseSleeveY, 0])
              rotate([ 0, 0, 90])
                threadedSleeveCorner(false, sleeveH, caseSleeveD, caseSleeveB, sleeveH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
          }
        }
      }
    }
    
    // Hopper inner hull
    translate([ 0, 0,-caseT/2-0.05]) {
      color("silver") {
        hull() {
          translate([ hopperW/2-caseR, hopperD/2-caseR, 0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([ hopperW/2-caseR,-hopperD/2+caseR, 0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([-hopperW/2+caseR,-hopperD/2+caseR, 0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          translate([-hopperW/2+caseR, hopperD/2-caseR, 0])
            cylinder(h=hopperFrameH-caseT, r=caseR-caseT, center=true);
          
          translate([ 5, 2, hopperH-backR-caseT])
            sphere(r = backR);
          translate([ 5,-2, hopperH-backR-caseT])
            sphere(r = backR);
          translate([-5,-2, hopperH-backR-caseT])
            sphere(r = backR);
          translate([-5, 2, hopperH-backR-caseT])
            sphere(r = backR);
        }
        
        // Opening for sink
        translate([ 0, 0, hopperH+caseT])
          cube([ sinkW, sinkD, sinkH*2], center=true);
      }
    }
  }
  
  // Case border
  translate([ caseOffsetX, 0, caseHopperH]) {
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

  translate([caseOffsetX, 0, 0]) {
    if (withDevices) {
      // Raspberry 3+
      translate([ raspiOffsetX, raspiOffsetY, raspiOffsetZ])
        rotate([ 0, 90, 180])
          pi3Bplus();
      
      // PoE HAT
      
      // PiSense HAT
      translate([ senseHatOffsetX, senseHatOffsetY, senseHatOffsetZ])
        rotate([ 0, 90, 180])
          piSense();
      
      translate([-caseOffsetX, 0, bucketOffsetZ])
        rotate([ 0, bucketRotate, 90])
          tippingBucket();
      
      translate([-caseOffsetX, 0, bucketOffsetZ]) {
        translate([-bucketD/2-bbHeight, 0, 0])
          rotate([ 0, 90, 180])
            ballBearing( bbHeight, bbOuterD, bbInnerD);
        translate([ bucketD/2+bbHeight, 0, 0])
          rotate([ 0, 90, 180])
            ballBearing( bbHeight, bbOuterD, bbInnerD);
      }
    }
  }
  
  translate([caseOffsetX, 0, caseChassisH/2]) {
    
    color("silver", transparency) {
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
        translate([0,0,caseT-caseT/2+0.05]) {
          hull() {
            translate([ caseW/2-caseR, caseD/2-caseR,0])
              cylinder(h=caseChassisH-caseT+0.1, r=caseR-caseT, center=true);
            translate([ caseW/2-caseR,-caseD/2+caseR,0])
              cylinder(h=caseChassisH-caseT+0.1, r=caseR-caseT, center=true);
            translate([-caseW/2+caseR,-caseD/2+caseR,0])
              cylinder(h=caseChassisH-caseT+0.1, r=caseR-caseT, center=true);
            translate([-caseW/2+caseR, caseD/2-caseR,0])
              cylinder(h=caseChassisH-caseT+0.1, r=caseR-caseT, center=true);
          }
        }
        
        // Water drain openings
        openingD = 5;
        openingW = 35;
        openingOffsetD = caseT*1.5+openingD/2;
        translate([ openingW/2, 0,-caseChassisH/2+caseT/2-0.05]) {
          translate([ 0, caseD/2-openingOffsetD, 0]) {
            opening( openingW, openingD, caseT+0.1);
          }
          translate([ 0, caseD/2-openingOffsetD*2, 0]) {
            opening( openingW, openingD, caseT+0.1);
          }
          translate([ 0, caseD/2-openingOffsetD*3, 0]) {
            opening( openingW, openingD, caseT+0.1);
          }
          
          translate([ 0,-caseD/2+openingOffsetD*3, 0]) {
            opening( openingW, openingD, caseT+0.1);
          }
          translate([ 0,-caseD/2+openingOffsetD*2, 0]) {
            opening( openingW, openingD, caseT+0.1);
          }
          translate([ 0,-caseD/2+openingOffsetD, 0]) {
            opening( openingW, openingD, caseT+0.1);
          }
        }
        translate([ raspiOffsetX-7, raspiOffsetY+17,-caseChassisH/2+caseT/2-0.05]) {
          opening( 20, 20, caseT+0.1);
        }
        
        // Case border
        translate([ 0, 0, caseChassisH/2]) {
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
      
      translate([-caseOffsetX, 0, bucketOffsetZ-caseT]) {
        translate([-bucketD/2-bbHeight, 0, -bucketOffsetZ]) {
          difference() {
            translate([ 0, 0, 1])
              cube([ caseT*2, caseD/4, bucketOffsetZ], center=true);
            translate([ 0, 0, bucketOffsetZ/2])
              rotate([ 0, 90, 180])
                cylinder(h=caseT*2+0.1, d=bbOuterD, center=true);
          }
        }
        translate([ bucketD/2+bbHeight, 0, -bucketOffsetZ]) {
          difference() {
            translate([ 0, 0, 1])
              cube([ caseT*2, caseD/4, bucketOffsetZ], center=true);
            translate([ 0, 0, bucketOffsetZ/2])
              rotate([ 0, 90, 180])
                cylinder(h=caseT*2+0.1, d=bbOuterD, center=true);
          }
        }
      }
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
    translate([ caseW/2-caseSleeveX, caseD/2-caseSleeveY,0])
      threadedSleeveCorner(false, caseChassisH, caseSleeveD, caseSleeveB, caseChassisH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
    translate([ caseW/2-caseSleeveX,-caseD/2+caseSleeveY,0])
      rotate([0,0,-90])
        threadedSleeveCorner(false, caseChassisH, caseSleeveD, caseSleeveB, caseChassisH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
    translate([-caseW/2+caseSleeveX,-caseD/2+caseSleeveY,0])
      rotate([0,0,180])
        threadedSleeveCorner(false, caseChassisH, caseSleeveD, caseSleeveB, caseChassisH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
    translate([-caseW/2+caseSleeveX, caseD/2-caseSleeveY,0])
      rotate([0,0,90])
        threadedSleeveCorner(false, caseChassisH, caseSleeveD, caseSleeveB, caseChassisH, caseR-caseT, caseSleeveX-caseT, caseSleeveY-caseT);
  }
}

// ==============================================================================================

if (displayBallBearing) {
  ballBearing( bbHeight, bbOuterD, bbInnerD);
}
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
    translate([ 0, 0, bucketOffsetZ])
      rotate([ 0, bucketRotate, 90])
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
  translate([ (caseD+10), 0, 0])
    rotate([ 0, 0, 90])
      case7back(false);

  translate([ 0, 0, 0])
    rotate([ 0, 0, 90])
      case7chassis(false);
}
