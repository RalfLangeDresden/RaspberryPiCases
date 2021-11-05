// ==================================================
// Raspberry Pi and HAT printed circuit boards
// (c) Ralf Lange, longsoft.de
// ==================================================

// External definitions
include <PiPcbConstants.scad>
include <PiPartConstants.scad>
include <../parts/PartConstants.scad>

// External modules
// use <PiOpenings.scad>
// use <../parts/Parts.scad>
use <PiPcbs.scad>
use <PiOpenings.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayPiCameraV2 = true;  // Raspberry PI Camera V2 Module
displayPiCameraHQ = false;  // Raspberry PI Camera HQ Module

detail = 1;

// Base on PI CAMERA MODULE V2.1 drawing
module piCameraV2()
{
  cameraRibbonW = 22.0;

  // PCB
  piCameraV2Pcb();

  // Sensor
  color("black")
    translate([piCameraV2PcbW/2 - 9.462, 0, (pcbT + 2.0)/2])
      cube([8.5, 8.5, 2.0], center=true);
  color("lightblue")
    translate([piCameraV2PcbW/2 - 9.462, 0, pcbT/2 + 2.0 + 2.0/2])
      difference() {
        cylinder(h=2.0, d=8.0, center=true);
        cylinder(h=2.1, d=2.0, center=true);
      }
  
  // Camera ribbon cable
  translate([piCameraV2OffsetX - ribbonConnectorH/2, 0, 0])
    rotate([180, 0, -90])
      connectRibbonHorizontal(cameraRibbonW, detail);
}

// header: 0 no, 1= up, -1, down
module piCameraHq(rotated = false)
{
  distRingH = 10.2;
  block1Backlog = 11.4;   // Backlog over the pcb edge
  block1W = 2 * block1Backlog;
  block1D = 13.97;
  block1H = 7.62;
  block2Backlog = 2.6;   // Backlog over the pcb edge
  block2Wplus = 2.0;     // Filling the gap
  block2W = 2 * block2Backlog + block2Wplus;
  block2D = (10.16 - 0.8)/2;
  block2H = 5.02;
  block2Gap = 0.8;       // Gap betrween the two blocks
  adjRing1D = 36.0;
  adjRing1H = 1.2;
  adjRing2D = 30.75;
  adjRing2H = 5.8;
  cameraRibbonW = 22.0;

  // PCB
  piCameraHqPcb();

  // Sensor
  color("blue")
    translate([0, 0, (pcbT + 1.0)/2])
      cube([8.5, 8.5, 1.0], center=true);
  
  // Objective mount
  difference() {
    union() {
      color("DarkSlateGray") {
        // Distance ring
        translate([0, 0, pcbT/2 + distRingH/2])
          cylinder(h=distRingH, d=32, center=true);
        // Camera mount block
        translate([piCameraHqPcbW/2, 0, pcbT/2 + distRingH/2 + (distRingH - block1H)/2])
          cube([block1W, block1D, block1H], center=true);
        // Brecats
        translate([-piCameraHqPcbW/2 + block2Wplus/2, 0, pcbT/2 + distRingH/2 + (distRingH - block2H)/2]) {
          translate([0, block2D/2 + block2Gap/2, 0])
            cube([block2W, block2D, block2H], center=true);
          translate([0, -(block2D/2 + block2Gap/2), 0])
            cube([block2W, block2D, block2H], center=true);
        }
      }
      // First adjustment ring
      color("Black")
        translate([0, 0, pcbT/2 + distRingH + adjRing1H/2])
          cylinder(h=adjRing1H, d=adjRing1D, center=true);
      // Second adjustment ring
      color("DarkSlateGray")
        translate([0, 0, pcbT/2 + distRingH + adjRing1H + adjRing2H/2])
          cylinder(h=adjRing2H, d=adjRing2D, center=true);
    }
    
    // Inner opening
    translate([0, 0, pcbT/2 + (17.2 + 0.1)/2])
      cylinder(h=17.2+0.1, d=22.4, center=true);
    // First adjustment ring openings (48)
    translate([0, 0, pcbT/2 + distRingH + adjRing1H/2])
      holesOnCircle(1.6, adjRing1H + 0.1, adjRing1D + 0.6, 48);  // 48 circles
    // Second adjustment ring openings (24)
    translate([0, 0, pcbT/2 + distRingH + adjRing1H + adjRing2H/2 + 0.1])
      holesOnCircle(2.0, adjRing2H + 0.1, adjRing2D + 0.6, 28);  // 28 circles
  }
  
  // Camera ribbon cable
  if (rotated) {
    translate([-(piCameraHqPcbW - ribbonConnectorH)/2, 0, 0])
      rotate([180, 0, 90])
        connectRibbonHorizontal(cameraRibbonW, detail);
  }
  else {
    translate([(piCameraHqPcbW - ribbonConnectorH)/2, 0, 0])
      rotate([180, 0, -90])
        connectRibbonHorizontal(cameraRibbonW, detail);
  }
}

if (displayPiCameraV2) {
  $fn=100;

  piCameraV2();
}
if (displayPiCameraHQ) {
  $fn=100;

  piCameraHq(true);
}
