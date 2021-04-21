// ========================================
// Raspberry Pi case with 7" touch display
// Version 2
// (c) Ralf Lange, longsoft.de
// ========================================

// Include the constants with the dimensions
// and the special variables
include <Case7Constants_V2.scad>;
include <raspberry/PiPcbConstants.scad>
include <raspberry/Pi3Constants.scad>;
include <raspberry/PiPartConstants.scad>
include <parts/Display7Constants.scad>;

use <parts/CaseParts.scad>
use <parts/Parts.scad>
use <raspberry/Pi3Boards.scad>
use <raspberry/PiOpenings.scad>
use <parts/Display7Board.scad>
use <parts/Modules.scad>
use <hat/HifiBerry.scad>
use <hat/PiUsvPlus.scad>

// Which one would you like to see?
displayFront = false;         // Front part of the case
displayChassis = false;       // Chassis part of the case
displayBack = false;          // Back part of the case
displayAll = false;           // All parts together
displayImage = true;         // All parts together in one image

displayDevices = true;
withThread = false;

// Details of the drawing (larger is better)
$fn=100;

// Display printed ciruits board position
displayOffsetX = (case7W-display7PcbW-2*case7T-2*case7displayXP)/2;
displayOffsetY = - (case7D-display7PcbD-2*case7T-2*case7displayYP)/2;
displayOffsetZ = 0;

// Rasberry Pi printed ciruits board position
raspiOffsetX = 30;
raspiOffsetY = -25;

module case7front(withDevices = false)
{
  version=2;

  color("silver")
  difference() {
    // Outer hull
    if (version==2) {
      hull() {
        translate([ case7W/2-case7R, case7D/2-case7R,0]) {
          translate([0,0,-(case7FrontH-case7T)/2])
            donut(case7R, case7R-case7T);
          translate([0,0,case7T/2])
            cylinder(h=case7FrontH-case7T, r=case7R, center=true);
        }
        translate([ case7W/2-case7R,-case7D/2+case7R,0]) {
          translate([0,0,-(case7FrontH-case7T)/2])
            donut(case7R, case7R-case7T);
          translate([0,0,case7T/2])
            cylinder(h=case7FrontH-case7T, r=case7R, center=true);
        }
        translate([-case7W/2+case7R,-case7D/2+case7R,0]) {
          translate([0,0,-(case7FrontH-case7T)/2])
            donut(case7R, case7R-case7T);
          translate([0,0,case7T/2])
            cylinder(h=case7FrontH-case7T, r=case7R, center=true);
        }
        translate([-case7W/2+case7R, case7D/2-case7R,0]) {
          translate([0,0,-(case7FrontH-case7T)/2])
            donut(case7R, case7R-case7T);
          translate([0,0,case7T/2])
            cylinder(h=case7FrontH-case7T, r=case7R, center=true);
        }
      }
    }
    else {
      hull() {
        translate([ case7W/2-case7R, case7D/2-case7R,0]) {
          cylinder(h=case7FrontH, r=case7R, center=true);
        }
        translate([ case7W/2-case7R,-case7D/2+case7R,0]) {
          cylinder(h=case7FrontH, r=case7R, center=true);
        }
        translate([-case7W/2+case7R,-case7D/2+case7R,0]) {
          cylinder(h=case7FrontH, r=case7R, center=true);
        }
        translate([-case7W/2+case7R, case7D/2-case7R,0]) {
          cylinder(h=case7FrontH, r=case7R, center=true);
        }
      }
    }

    // Inner hull
    translate([0,0,case7T-case7T/2+0.1]) {
      hull() {
        translate([ case7W/2-case7R, case7D/2-case7R,0])
          cylinder(h=case7FrontH-case7T+0.2, r=case7R-case7T, center=true);
        translate([ case7W/2-case7R,-case7D/2+case7R,0])
          cylinder(h=case7FrontH-case7T+0.2, r=case7R-case7T, center=true);
        translate([-case7W/2+case7R,-case7D/2+case7R,0])
          cylinder(h=case7FrontH-case7T+0.2, r=case7R-case7T, center=true);
        translate([-case7W/2+case7R, case7D/2-case7R,0])
          cylinder(h=case7FrontH-case7T+0.2, r=case7R-case7T, center=true);
      }
    }

    // Display glas frame
    glasFrameT = 2.0;    // Thickness of the glas frame
    glasOffsetX = displayOffsetX - (display7GlasPcbDeltaXP-display7GlasPcbDeltaXN)/2;
    echo("Glas offset X: ", glasOffsetX);
    glasOffsetY = displayOffsetY - (display7GlasPcbDeltaYP-display7GlasPcbDeltaYN)/2;
    echo("Glas offset Y: ", glasOffsetY);
    glasOffsetZ = -case7FrontH/2+case7T/2+(case7T-glasFrameT)/2;
    echo("Glas offset Z: ", glasOffsetZ);

    pgxp = (case7W - display7GlasW)/2 - glasOffsetX;
    echo("Left glas border width: ", pgxp);
    pgxn = (case7W - display7GlasW)/2 + glasOffsetX;
    echo("Right glas border width: ", pgxn);
    pgyn = (case7D - display7GlasD)/2 - glasOffsetY;
    echo("Top glas border width: ", pgyn);
    pgyp = (case7D - display7GlasD)/2 + glasOffsetY;
    echo("Bottom glas border width: ", pgyp);

    // Display glas opening
    translate([glasOffsetX,glasOffsetY,glasOffsetZ]) {
      cube([display7GlasW+2,display7GlasD+2,glasFrameT+0.1], center=true);
      // cube([display7GlasW+2,display7GlasD+2,10], center=true);
    }

    // Display touch window
    touchOffsetX = glasOffsetX + (display7BlackGlasDeltaXP-display7BlackGlasDeltaXN)/2;
    echo("Touch offset X: ", touchOffsetX);
    touchOffsetY = glasOffsetY - (display7BlackGlasDeltaYP-display7BlackGlasDeltaYN)/2;
    echo("Touch offset Y: ", touchOffsetY);
    touchOffsetZ = -case7FrontH/2+(case7T-glasFrameT)/2;
    echo("Touch offset Z: ", touchOffsetZ);

    ptxp = (case7W - display7W)/2 - touchOffsetX - display7BlackBorder;
    echo("Left touch border width: ", ptxp);
    ptxn = (case7W - display7W)/2 + touchOffsetX - display7BlackBorder;
    echo("Right touch border width: ", ptxn);
    ptyn = (case7D - display7D)/2 - touchOffsetY - display7BlackBorder;
    echo("Bottom touch border width: ", ptyn);
    ptyp = (case7D - display7D)/2 + touchOffsetY - display7BlackBorder;
    echo("Top touch border width: ", ptyp);

    translate([touchOffsetX,touchOffsetY,touchOffsetZ]) {
      cube([display7W+2*display7BlackBorder,display7D+2*display7BlackBorder,case7T-glasFrameT+0.1], center=true);
    }
  }

  // Case threaded sleeves
  translate([ case7W/2-case7BushX, case7D/2-case7BushY,0])
    threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T, case7BushY-case7T);
  translate([ case7W/2-case7BushX,-case7D/2+case7BushY,0])
    rotate([0,0,-90])
      threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T, case7BushY-case7T);
  translate([-case7W/2+case7BushX,-case7D/2+case7BushY,0])
    rotate([0,0,180])
      threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T, case7BushY-case7T);
  translate([-case7W/2+case7BushX, case7D/2-case7BushY,0])
    rotate([0,0,90])
      threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T, case7BushY-case7T);

  if (withDevices) {
    // 7" Display
    translate([displayOffsetX,displayOffsetY,displayOffsetZ])
      display7();
  }
}

module case7chassis(withDevices = false)
{
  cableOffsetY = 19;

  color("silver")
  difference() {
    // Outer hull
    hull() {
      translate([ case7W/2-case7R, case7D/2-case7R,0])
        cylinder(h=case7ChassisH, r=case7R, center=true);
      translate([ case7W/2-case7R,-case7D/2+case7R,0])
        cylinder(h=case7ChassisH, r=case7R, center=true);
      translate([-case7W/2+case7R,-case7D/2+case7R,0])
        cylinder(h=case7ChassisH, r=case7R, center=true);
      translate([-case7W/2+case7R, case7D/2-case7R,0])
        cylinder(h=case7ChassisH, r=case7R, center=true);
    }

    // Inner hull
    translate([0,0,chassisT-chassisT/2+0.05]) {
      hull() {
        translate([ case7W/2-case7R, case7D/2-case7R,0])
          cylinder(h=case7ChassisH-chassisT+0.1, r=case7R-case7T, center=true);
        translate([ case7W/2-case7R,-case7D/2+case7R,0])
          cylinder(h=case7ChassisH-chassisT+0.1, r=case7R-case7T, center=true);
        translate([-case7W/2+case7R,-case7D/2+case7R,0])
          cylinder(h=case7ChassisH-chassisT+0.1, r=case7R-case7T, center=true);
        translate([-case7W/2+case7R, case7D/2-case7R,0])
          cylinder(h=case7ChassisH-chassisT+0.1, r=case7R-case7T, center=true);
      }
    }

    chassisOpeningZ = -case7ChassisH/2+chassisT/2;
    chassisOffsetZ = chassisOpeningZ+0.2;
    // Opening for touch display HDMI ans USB cable
    translate([-case7W/2+6,cableOffsetY,chassisOpeningZ]) {
      hull() {
        translate([ 0, 26, 0])
          cylinder(h=chassisT+0.1, r=case7T, center=true);
        translate([ 0,-26, 0])
          cylinder(h=chassisT+0.1, r=case7T, center=true);
        translate([25, 26, 0])
          cylinder(h=chassisT+0.1, r=case7T, center=true);
        translate([25,-26, 0])
          cylinder(h=chassisT+0.1, r=case7T, center=true);
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

    /* Boreholes for USB port XRL shell
    translate([-case7W/2+case7T/2,-30,2])
      rotate([0,90,0]) {
        translate([0,0,0])
          cylinder(h=case7T+1, d=22.0, center=true);
        translate([19.8/2,-19.8/2,0])
          cylinder(h=case7T+1, d=3.2, center=true);
        translate([-19.8/2,19.8/2,0])
          cylinder(h=case7T+1, d=3.2, center=true);
      } */

    // Boreholes for case threaded sleeves
    translate([0,0,chassisOffsetZ]) {
      translate([ case7W/2-case7BushX, case7D/2-case7BushY,0])
        cylinder(h=chassisT+0.2, d=case7BushB, center=true);
      translate([ case7W/2-case7BushX,-case7D/2+case7BushY,0])
        cylinder(h=chassisT+0.2, d=case7BushB, center=true);
      translate([-case7W/2+case7BushX,-case7D/2+case7BushY,0])
        cylinder(h=chassisT+0.2, d=case7BushB, center=true);
      translate([-case7W/2+case7BushX, case7D/2-case7BushY,0])
        cylinder(h=chassisT+0.2, d=case7BushB, center=true);
    }

    // Boreholes for fixing battery
    batteryW = 63.0;
    batteryD = 20.0;
    batteryHoleR = 2.0;
    batteryOffsetX = -25;
    batteryOffsetY = 45; // (case7D-batteryD)/2-batteryHoleR-case7T;

    translate([batteryOffsetX,batteryOffsetY,chassisOffsetZ])
      rotate([0,0,180]) {
        translate([-(batteryW/2-10),-(batteryD+batteryHoleR)/2,0])
          cylinder(h=chassisT+0.1, d=batteryHoleR, center=true);
        translate([-(batteryW/2-10), (batteryD+batteryHoleR)/2,0])
          cylinder(h=chassisT+0.1, d=batteryHoleR, center=true);
        translate([ batteryW/2-10,-(batteryD+batteryHoleR)/2,0])
          cylinder(h=chassisT+0.1, d=batteryHoleR, center=true);
        translate([ batteryW/2-10, (batteryD+batteryHoleR)/2,0])
          cylinder(h=chassisT+0.1, d=batteryHoleR, center=true);
      }

    // Boreholes for cooling air
    translate([-case7W/2+case7T/2,0,0])
      rotate([0,90,0]) {
        coolingBoreholes(case7T);
      }

    // Fan
    // Opening
    translate([+case7W/2-8,raspiOffsetY,chassisOpeningZ]) {
      piFanOpening(chassisT);
    }
    // Boreholes
    translate([+case7W/2-case7T/2,raspiOffsetY,0])
      rotate([0,90,0]) {
        piFanBoreholes(case7T);
      }

    // Additional openings
    // Quadreant I:
    translate([45, 34,chassisOpeningZ]) {
      opening(52, 34, case7T);
    }
    translate([85, 30.5,chassisOpeningZ]) {
      opening(11, 27, case7T);
    }

    // Quadrant II:

    // Quadrant III:
    translate([-40,-34.5,chassisOpeningZ]) {
      opening(32, 37, case7T);
    }
    translate([-77,-32,chassisOpeningZ]) {
      opening(22, 32, case7T);
    }
    translate([-40,0,chassisOpeningZ]) {
      opening(32, 16, case7T);
    }

    // Quadrant IV: Accumulator
    translate([-23, 23,chassisOpeningZ]) {
      opening(66, 12, case7T);
    }
    translate([-23, 45,chassisOpeningZ]) {
      opening(66, 12, case7T);
    }
  }

  // Case threaded sleeves
  translate([ case7W/2-case7BushX, case7D/2-case7BushY,0])
    threadedSleeveCorner(false, case7ChassisH, case7BushD, case7BushB, case7ChassisH, case7R-case7T, case7BushX-case7T, case7BushY-case7T);
  translate([ case7W/2-case7BushX,-case7D/2+case7BushY,0])
    rotate([0,0,-90])
      threadedSleeveCorner(false, case7ChassisH, case7BushD, case7BushB, case7ChassisH, case7R-case7T, case7BushX-case7T, case7BushY-case7T);
  translate([-case7W/2+case7BushX,-case7D/2+case7BushY,0])
    rotate([0,0,180])
      threadedSleeveCorner(false, case7ChassisH, case7BushD, case7BushB, case7ChassisH, case7R-case7T, case7BushX-case7T, case7BushY-case7T);
  translate([-case7W/2+case7BushX, case7D/2-case7BushY,0])
    rotate([0,0,90])
      threadedSleeveCorner(false, case7ChassisH, case7BushD, case7BushB, case7ChassisH, case7R-case7T, case7BushX-case7T, case7BushY-case7T);

  if (withDevices) {
    // Raspberry 3+
    raspiOffsetZ = -case7ChassisH/2 + case7T;
    translate([raspiOffsetX,raspiOffsetY,raspiOffsetZ])
      rotate([0,0,180])
        pi3Bplus();

    hatOffsetX = raspiOffsetX + (pi3bPcbW-pi3HatPcbW)/2;
    hatOffsetY = raspiOffsetY;

    // PiUSV+
    piusvOffsetZ = raspiOffsetZ + 10;
    translate([hatOffsetX,hatOffsetY,piusvOffsetZ])
      rotate([0,0,180])
        piUsvPlus();

    // HiFiBerry
    hifiOffsetZ = piusvOffsetZ + 12;
    translate([hatOffsetX,hatOffsetY,hifiOffsetZ])
      rotate([0,0,180])
        hifiBerryDacPlus();

    // 7" Display
    displayOffsetZ = -case7ChassisH/2 - 8.5;
    echo("Display offset Z: ", displayOffsetZ);

    translate([displayOffsetX,displayOffsetY,displayOffsetZ])
      display7();

    // Pi fan
    translate([+case7W/2-piFanH,raspiOffsetY,0])
      rotate([0,90,0]) {
        piFan();
      }

    // Accumulator
    translate([-23,45,-5])
      accuNCR18650B();

    /* USB XLR shell
    translate([-case7W/2+case7T,0,1])
      rotate([0,0,180])
        xlrShell();
    */
    /* SDR USB Stick
    translate([-case7W/2+case7T+67.71/2+8,-44,0])
      // rotate([0,0,180])
        sdrStick2();
    */
  }
}

module case7back(withDevices = false)
{
  backR = 10;
  holeR = 6;
  holeH = 6;
  holeZ = 6;

  version=2;

  difference() {
    color("silver") {
      difference() {
        // Outer hull
        if (version==2) {
          hull() {
            translate([ case7W/2-case7R, case7D/2-case7R,0]) {
              translate([0,0,(case7BackFrameH-case7T)/2])
                donut(case7R, case7R-case7T);
              translate([0,0,-case7T/2])
                cylinder(h=case7BackFrameH-case7T, r=case7R, center=true);
            }
            translate([ case7W/2-case7R,-case7D/2+case7R,0]) {
              translate([0,0,(case7BackFrameH-case7T)/2])
                donut(case7R, case7R-case7T);
              translate([0,0,-case7T/2])
                cylinder(h=case7BackFrameH-case7T, r=case7R, center=true);
            }
            translate([-case7W/2+case7R,-case7D/2+case7R,0]) {
              translate([0,0,(case7BackFrameH-case7T)/2])
                donut(case7R, case7R-case7T);
              translate([0,0,-case7T/2])
                cylinder(h=case7BackFrameH-case7T, r=case7R, center=true);
            }
            translate([-case7W/2+case7R, case7D/2-case7R,0]) {
              translate([0,0,(case7BackFrameH-case7T)/2])
                donut(case7R, case7R-case7T);
              translate([0,0,-case7T/2])
                cylinder(h=case7BackFrameH-case7T, r=case7R, center=true);
            }

            translate([40,20,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
            translate([40,-10,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
            translate([-40,-10,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
            translate([-40,20,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
          }
        }
        else {
          hull() {
            translate([ case7W/2-case7R, case7D/2-case7R,0])
              cylinder(h=case7BackFrameH, r=case7R, center=true);
            translate([ case7W/2-case7R,-case7D/2+case7R,0])
              cylinder(h=case7BackFrameH, r=case7R, center=true);
            translate([-case7W/2+case7R,-case7D/2+case7R,0])
              cylinder(h=case7BackFrameH, r=case7R, center=true);
            translate([-case7W/2+case7R, case7D/2-case7R,0])
              cylinder(h=case7BackFrameH, r=case7R, center=true);

            translate([40,20,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
            translate([40,-10,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
            translate([-40,-10,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
            translate([-40,20,case7BackH-case7BackFrameH-backR])
              sphere(r = backR);
          }
        }

        // Inner hull
        translate([0,0,-case7T/2-0.05]) {
          hull() {
            translate([ case7W/2-case7R, case7D/2-case7R,0])
              cylinder(h=case7BackFrameH-case7T, r=case7R-case7T, center=true);
            translate([ case7W/2-case7R,-case7D/2+case7R,0])
              cylinder(h=case7BackFrameH-case7T, r=case7R-case7T, center=true);
            translate([-case7W/2+case7R,-case7D/2+case7R,0])
              cylinder(h=case7BackFrameH-case7T, r=case7R-case7T, center=true);
            translate([-case7W/2+case7R, case7D/2-case7R,0])
              cylinder(h=case7BackFrameH-case7T, r=case7R-case7T, center=true);
            translate([40,20,case7BackH-case7BackFrameH-backR-case7T])
              sphere(r = backR);
            translate([40,-10,case7BackH-case7BackFrameH-backR-case7T])
              sphere(r = backR);
            translate([-40,-10,case7BackH-case7BackFrameH-backR-case7T])
              sphere(r = backR);
            translate([-40,20,case7BackH-case7BackFrameH-backR-case7T])
              sphere(r = backR);
          }
        }
      }

      // Additional blocks for holes for bolt heads
      translate([ case7W/2-case7BushX, case7D/2-case7BushY,case7BackFrameH/2/2])
        rotate([180,0,90])
          blockBoltHead(14, 14, case7BackFrameH/2, case7R, case7BackFrameH, case7BushD, case7BushB);
      translate([ case7W/2-case7BushX,-case7D/2+case7BushY,case7BackFrameH/2/2])
        rotate([180,0,0])
          blockBoltHead(14, 14, case7BackFrameH/2, case7R, case7BackFrameH, case7BushD, case7BushB);
      translate([-case7W/2+case7BushX,-case7D/2+case7BushY,case7BackFrameH/2/2])
        rotate([180,0,-90])
          blockBoltHead(14, 14, case7BackFrameH/2, case7R, case7BackFrameH, case7BushD, case7BushB);
      translate([-case7W/2+case7BushX, case7D/2-case7BushY,case7BackFrameH/2/2])
        rotate([180,0,180])
          blockBoltHead(14, 14, case7BackFrameH/2, case7R, case7BackFrameH, case7BushD, case7BushB);
    }

    // Holes for bolt heads
    translate([ case7W/2-case7BushX, case7D/2-case7BushY,-case7BackFrameH/2+holeZ])
      cylinder(h=holeH, r=holeR, center=false);
    translate([ case7W/2-case7BushX,-case7D/2+case7BushY,-case7BackFrameH/2+holeZ])
      cylinder(h=holeH, r=holeR, center=false);
    translate([-case7W/2+case7BushX,-case7D/2+case7BushY,-case7BackFrameH/2+holeZ])
      cylinder(h=holeH, r=holeR, center=false);
    translate([-case7W/2+case7BushX, case7D/2-case7BushY,-case7BackFrameH/2+holeZ])
      cylinder(h=holeH, r=holeR, center=false);

    // Holes for bolts
    translate([ case7W/2-case7BushX, case7D/2-case7BushY,-case7BackFrameH/2])
      cylinder(h=case7BackFrameH, d=case7BushB, center=false);
    translate([ case7W/2-case7BushX,-case7D/2+case7BushY,-case7BackFrameH/2])
      cylinder(h=case7BackFrameH, d=case7BushB, center=false);
    translate([-case7W/2+case7BushX,-case7D/2+case7BushY,-case7BackFrameH/2])
      cylinder(h=case7BackFrameH, d=case7BushB, center=false);
    translate([-case7W/2+case7BushX, case7D/2-case7BushY,-case7BackFrameH/2])
      cylinder(h=case7BackFrameH, d=case7BushB, center=false);

    // Opening for chinch cable
    translate([25,40,0])
      rotate([-30,0,0])
        cube([30,16,40], center=true);
  }
}

module temp()
{

    difference() {
    }

}

// ==============================================================================================

if(displayFront) {
  case7front(displayDevices);
}
if(displayChassis) {
  case7chassis(displayDevices);
}
if(displayBack) {
  case7back(displayDevices);
}
if(displayAll) {
  rotate([0,180,0])
    case7back(false);

  translate([0,0,case7BackFrameH/2 + case7ChassisH/2 + 1])
    rotate([0,180,0])
      case7chassis(displayDevices);

  translate([0,0,case7BackFrameH/2 + case7ChassisH + case7FrontH/2 + 2])
    rotate([0,180,0])
      case7front(false);
}
if(displayImage) {
  translate([(case7D+10),0,0])
    rotate([0,0,90])
      case7back(false);

  translate([0,0,0])
    rotate([0,0,90])
      case7chassis(false);

  translate([-(case7D+10),0,0])
    rotate([0,0,90])
      case7front(false);
}
