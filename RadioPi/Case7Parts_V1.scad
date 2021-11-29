// ========================================
// Raspberry Pi case with 7" touch display
// Version 1
// (c) Ralf Lange, longsoft.de
// ========================================

// Include the constants with the dimensions
// and the special variables
include <Case7Constants_V1.scad>;
include <../parts/Display7Constants.scad>;

use <../parts/Parts.scad>
use <../parts/Display7Board.scad>
use <../raspberry/Pi3Boards.scad>

// Which one would you like to see?
displayFront = false;         // Front part of the case
displayChassis = false;       // Chassis part of the case
displayBack = false;          // Back part of the case
displayAll = true;           // All parts together
displayImage = false;         // All parts together in one image

// Display printed ciruits board position
displayOffsetX = (case7W-display7PcbW-2*case7T-2*case7displayXP)/2;
echo("Display offset X: ", displayOffsetX);
displayOffsetY = - (case7D-display7PcbD-2*case7T-2*case7displayYP)/2;
echo("Display offset Y: ", displayOffsetY);
displayOffsetZ = 0;
echo("Display offset Z: ", displayOffsetZ);

displayDevices = false;
withThread = false;

module case7front(withDevices = false)
{
  color("silver")
  difference() {
    // Outer hull
    hull() {
      translate([ case7W/2-case7R, case7D/2-case7R,0])
        cylinder(h=case7FrontH, r=case7R, center=true);
      translate([ case7W/2-case7R,-case7D/2+case7R,0])
        cylinder(h=case7FrontH, r=case7R, center=true);
      translate([-case7W/2+case7R,-case7D/2+case7R,0])
        cylinder(h=case7FrontH, r=case7R, center=true);
      translate([-case7W/2+case7R, case7D/2-case7R,0])
        cylinder(h=case7FrontH, r=case7R, center=true);
    }

    // Inner hull
    translate([0,0,case7T-case7T/2+0.1]) {
      hull() {
        translate([ case7W/2-case7R, case7D/2-case7R,0])
          cylinder(h=case7FrontH-case7T, r=case7R-case7T, center=true);
        translate([ case7W/2-case7R,-case7D/2+case7R,0])
          cylinder(h=case7FrontH-case7T, r=case7R-case7T, center=true);
        translate([-case7W/2+case7R,-case7D/2+case7R,0])
          cylinder(h=case7FrontH-case7T, r=case7R-case7T, center=true);
        translate([-case7W/2+case7R, case7D/2-case7R,0])
          cylinder(h=case7FrontH-case7T, r=case7R-case7T, center=true);
      }
    }

    // Display glas opening
    glasFrameT = 2.0;    // Thickness of the glas frame
    glasOffsetX = displayOffsetX - (display7GlasPcbDeltaXP-display7GlasPcbDeltaXN)/2;
    glasOffsetY = displayOffsetY - (display7GlasPcbDeltaYP-display7GlasPcbDeltaYN)/2;
    glasOffsetZ = -case7FrontH/2+case7T/2+(case7T-glasFrameT)/2;

    translate([glasOffsetX,glasOffsetY,glasOffsetZ+0.1]) {
      cube([display7GlasW+2,display7GlasD+2,glasFrameT+0.2], center=true);
    }

    // Display touch opening
    touchOffsetX = glasOffsetX + (display7BlackGlasDeltaXP-display7BlackGlasDeltaXN)/2;
    touchOffsetY = glasOffsetY - (display7BlackGlasDeltaYP-display7BlackGlasDeltaYN)/2;
    touchOffsetZ = -case7FrontH/2+(case7T-glasFrameT)/2;

    translate([touchOffsetX,touchOffsetY,touchOffsetZ]) {
      cube([display7W+2*display7BlackBorder,display7D+2*display7BlackBorder,case7T-glasFrameT+0.2], center=true);
    }
  }

  // Case threaded sleeves
  translate([ case7W/2-case7BushX, case7D/2-case7BushY,0])
    threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
  translate([ case7W/2-case7BushX,-case7D/2+case7BushY,0])
    rotate([0,0,-90])
      threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
  translate([-case7W/2+case7BushX,-case7D/2+case7BushY,0])
    rotate([0,0,180])
      threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
  translate([-case7W/2+case7BushX, case7D/2-case7BushY,0])
    rotate([0,0,90])
      threadedSleeveCorner(withThread, case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);

  // Chassis threaded sleeves
  translate([case7W/2-chassisBushXR, case7D/2-case7BushY, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([case7W/2-case7BushY, case7D/2-chassisBushX, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([case7W/2-case7BushY, -case7D/2+chassisBushX, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([case7W/2-chassisBushXR, -case7D/2+case7BushY, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([0, -case7D/2+chassisBushY, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([-case7W/2+chassisBushXL, -case7D/2+case7BushY, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([-case7W/2+case7BushY, -case7D/2+chassisBushX, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([-case7W/2+case7BushY, case7D/2-chassisBushX, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([-case7W/2+chassisBushXL, case7D/2-case7BushY, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);
  translate([0, case7D/2-chassisBushY, 0])
    threadedSleeve(withThread, chassisBushH, chassisBushD, chassisBushB, chassisBushH-case7T);

  if (withDevices) {
    // 7" Display
    translate([displayOffsetX, displayOffsetY, displayOffsetZ])
      display7();
  }
}

module case7chassis(withDevices = false)
{
  hD = 4;
  hR = 6;

  color("silver")
  difference() {
    // Base plate
    hull() {
      translate([ case7W/2-case7R, case7D/2-case7R,0])
        cylinder(h=chassisT, r=case7R-case7T-chassisG, center=true);
      translate([ case7W/2-case7R,-case7D/2+case7R,0])
        cylinder(h=chassisT, r=case7R-case7T-chassisG, center=true);
      translate([-case7W/2+case7R,-case7D/2+case7R,0])
        cylinder(h=chassisT, r=case7R-case7T-chassisG, center=true);
      translate([-case7W/2+case7R, case7D/2-case7R,0])
        cylinder(h=chassisT, r=case7R-case7T-chassisG, center=true);
    }

    // Opening for bolt case
    translate([ case7W/2-case7BushX, case7D/2-case7BushY,0])
      cube([case7BushX*2,case7BushY*2,chassisT+0.1], center=true);
    translate([ case7W/2-case7BushX,-case7D/2+case7BushY,0])
      cube([case7BushX*2,case7BushY*2,chassisT+0.1], center=true);
    translate([-case7W/2+case7BushX,-case7D/2+case7BushY,0])
      cube([case7BushX*2,case7BushY*2,chassisT+0.1], center=true);
    translate([-case7W/2+case7BushX, case7D/2-case7BushY,0])
      cube([case7BushX*2,case7BushY*2,chassisT+0.1], center=true);

    // Chassis threaded sleeves
    translate([case7W/2-chassisBushXR, case7D/2-case7BushY, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([case7W/2-case7BushY, case7D/2-chassisBushX, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([case7W/2-case7BushY, -case7D/2+chassisBushX, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([case7W/2-chassisBushXR, -case7D/2+case7BushY, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([0, -case7D/2+chassisBushY, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([-case7W/2+chassisBushXL, -case7D/2+case7BushY, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([-case7W/2+case7BushY, -case7D/2+chassisBushX, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([-case7W/2+case7BushY, case7D/2-chassisBushX, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([-case7W/2+chassisBushXL, case7D/2-case7BushY, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
    translate([0, case7D/2-chassisBushY, 0])
      cylinder(h=chassisT+0.1, d=chassisBushB, center=true);
  }

  if (withDevices) {
    // Raspberry 3+
    translate([0,0,5]) pi3Bplus();

    // 7" Display
    translate([displayOffsetX, displayOffsetY, -9])
      display7();
  }
}

module case7back(withDevices = false)
{
  hD = 4;
  hR = 6;

  color("silver")
  difference() {
    // Outer hull
    hull() {
      translate([ case7W/2-case7R, case7D/2-case7R,0]) cylinder(h=case7H-case7FrontH, r=case7R, center=true);
      translate([ case7W/2-case7R,-case7D/2+case7R,0]) cylinder(h=case7H-case7FrontH, r=case7R, center=true);
      translate([-case7W/2+case7R,-case7D/2+case7R,0]) cylinder(h=case7H-case7FrontH, r=case7R, center=true);
      translate([-case7W/2+case7R, case7D/2-case7R,0]) cylinder(h=case7H-case7FrontH, r=case7R, center=true);
    }

    // Inner hull
    difference() {
      translate([0,0,-case7T/2-0.1]) {
        hull() {
          translate([ case7W/2-case7R, case7D/2-case7R,0]) cylinder(h=case7H-case7FrontH-case7T, r=case7R-case7T, center=true);
          translate([ case7W/2-case7R,-case7D/2+case7R,0]) cylinder(h=case7H-case7FrontH-case7T, r=case7R-case7T, center=true);
          translate([-case7W/2+case7R,-case7D/2+case7R,0]) cylinder(h=case7H-case7FrontH-case7T, r=case7R-case7T, center=true);
          translate([-case7W/2+case7R, case7D/2-case7R,0]) cylinder(h=case7H-case7FrontH-case7T, r=case7R-case7T, center=true);
        }
      }

      // Additional blocks for holes for bolt heads
      translate([ case7W/2-case7BushX, case7D/2-case7BushY,(case7H-case7FrontH)/2-hD])
        rotate([180,0,0])
          blockBoltHead(case7H-case7FrontH, case7BushD, case7BushB+1);
      translate([ case7W/2-case7BushX,-case7D/2+case7BushY,(case7H-case7FrontH)/2-hD])
        rotate([180,0,0])
          blockBoltHead(case7H-case7FrontH, case7BushD, case7BushB+1);
      translate([-case7W/2+case7BushX,-case7D/2+case7BushY,(case7H-case7FrontH)/2-hD])
        rotate([180,0,0])
          blockBoltHead(case7H-case7FrontH, case7BushD, case7BushB+1);
      translate([-case7W/2+case7BushX, case7D/2-case7BushY,(case7H-case7FrontH)/2-hD])
        rotate([180,0,0])
          blockBoltHead(case7H-case7FrontH, case7BushD, case7BushB+1);
    }
  }

  // Case threaded sleeves
  translate([ case7W/2-case7BushX, case7D/2-case7BushY,0])
    rotate([0,180,-90])
      threadedSleeveCorner(false, case7H-case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
  translate([ case7W/2-case7BushX,-case7D/2+case7BushY,0])
    rotate([0,180,180])
      threadedSleeveCorner(false, case7H-case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
  translate([-case7W/2+case7BushX,-case7D/2+case7BushY,0])
    rotate([0,180,90])
      threadedSleeveCorner(false, case7H-case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
  translate([-case7W/2+case7BushX, case7D/2-case7BushY,0])
    rotate([0,180,0])
      threadedSleeveCorner(false, case7H-case7FrontH, case7BushD, case7BushB, case7FrontH-case7T, case7R-case7T, case7BushX-case7T/2, case7BushY-case7T/2);
}

module blockBoltHead(bushH=20, bushD=8, bushB=4)
{
  hD = 4;
  hR = 6;

  difference () {
    color("blue") {
      hull() {
        translate([ case7BushX-case7T, case7BushY-case7T,0]) cylinder(h=hD, r=case7R-case7T, center=true);
        translate([ case7BushX-case7T,-case7BushY+case7T,0]) cylinder(h=hD, r=case7R-case7T, center=true);
        translate([-case7BushX+case7T,-case7BushY+case7T,0]) cylinder(h=hD, r=case7R-case7T, center=true);
        translate([-case7BushX+case7T, case7BushY-case7T,0]) cylinder(h=hD, r=case7R-case7T, center=true);
      }

      translate([0,0,bushH/2-hD/2]) {
        cylinder(h=bushH, d=bushD, center=true);
      }
    }

    translate([0,0,bushH/2-hD/2]) {
      cylinder(h=bushH, d=bushB, center=true);
    }
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
  translate([0, 0, case7FrontH+10])
    rotate([0,180,0])
      case7front(false);

  translate([0, 0, 0])
    rotate([0, 180, 0])
      case7chassis(displayDevices);

  translate([0, 0, -case7BackH-10])
    rotate([0,180,0])
      case7back(false);
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
