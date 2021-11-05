// ============================================================
// StopMotionPi case with Raspberry Pi 4, Camera HQ and UPV
// Case parts
// Version 1
// (c) Ralf Lange, longsoft.de
// ============================================================

// Include the constants with the dimensions
// and the special variables
include <CaseStopMotionPiConstants.scad>;
include <raspberry/PiPcbConstants.scad>;
include <raspberry/PiPartConstants.scad>;
include <raspberry/Pi4Constants.scad>;
include <parts/Display7Constants.scad>;
include <parts/PartConstants.scad>;
include <hat/PiModulesConstants.scad>

use <parts/CaseParts.scad>
use <parts/Parts.scad>
use <parts/Modules.scad>
use <raspberry/Pi4Boards.scad>
use <raspberry/PiPcbs.scad>
use <raspberry/PiOpenings.scad>;
use <raspberry/PiCameraBoards.scad>;
use <hat/PiModules.scad>

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

// Rasberry Pi printed ciruits board position
raspiOffsetX = 5;
raspiOffsetY = -4;
raspiOffsetZ = -stopMotionPiChassisH/2 + stopMotionPiT;
holeH = 2;

module stopMotionPiFront(withDevices = false)
{
  cameraOffsetX = 0.0;
  cameraOffsetY = -5.0;
  cameraOffsetZ = -(stopMotionPiFrontH - stopMotionPiT/2)/2;
  
  color("silver") {
    difference() {
      // Outer hull
      hull() {
        translate([ stopMotionPiW/2-stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiFrontH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
        translate([ stopMotionPiW/2-stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiFrontH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
        translate([-stopMotionPiW/2+stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiFrontH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
        translate([-stopMotionPiW/2+stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiFrontH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
      }
      
      // Inner hull
      translate([0,0,stopMotionPiT/2+0.1]) {
        hull() {
          translate([ stopMotionPiW/2-stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([ stopMotionPiW/2-stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([-stopMotionPiW/2+stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([-stopMotionPiW/2+stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
            cylinder(h=stopMotionPiFrontH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
        }
      }
      
      // Camera pcb
      translate([cameraOffsetX, cameraOffsetY, cameraOffsetZ])
        rotate([180, 0, -90])
          cameraHqOpening(stopMotionPiT);
      
      // Boreholes over Raspberry Pi boreholes
      translate([raspiOffsetX - pi3bHoleDC, raspiOffsetY, 0]) {
        translate([0, 0, -stopMotionPiFrontH/2 + stopMotionPiT/2])
          boreholes(pi4bHoleX, pi4bHoleY, pi4bHoleD, stopMotionPiT + 0.2);
        translate([0, 0, -stopMotionPiFrontH/2])
          boreholes(pi4bHoleX, pi4bHoleY, 2*pi4bHoleD, holeH);
      }
    }
  }
  
  // Render devices?
  if (withDevices) {
    // Raspberry Camera HQ
    translate([cameraOffsetX, cameraOffsetY, cameraOffsetZ])
      rotate([180, 0, -90]) {
        piCameraHq(true);
      }
  }
}

module stopMotionPiChassis(withDevices = false)
{
  raspiOpeningZ = -stopMotionPiChassisH/2 + chassisT/2;

  color("silver") {
    difference() {
      // Outer hull
      hull() {
        translate([ stopMotionPiW/2-stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
          cylinder(h=stopMotionPiChassisH, r=stopMotionPiR, center=true);
        translate([ stopMotionPiW/2-stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
          cylinder(h=stopMotionPiChassisH, r=stopMotionPiR, center=true);
        translate([-stopMotionPiW/2+stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
          cylinder(h=stopMotionPiChassisH, r=stopMotionPiR, center=true);
        translate([-stopMotionPiW/2+stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
          cylinder(h=stopMotionPiChassisH, r=stopMotionPiR, center=true);
      }
      
      // Inner hull
      translate([0,0,chassisT-chassisT/2+0.05]) {
        hull() {
          translate([ stopMotionPiW/2-stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
            cylinder(h=stopMotionPiChassisH-chassisT+0.1, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([ stopMotionPiW/2-stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
            cylinder(h=stopMotionPiChassisH-chassisT+0.1, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([-stopMotionPiW/2+stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
            cylinder(h=stopMotionPiChassisH-chassisT+0.1, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([-stopMotionPiW/2+stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
            cylinder(h=stopMotionPiChassisH-chassisT+0.1, r=stopMotionPiR-stopMotionPiT, center=true);
        }
      }
      
      // Opening and boreholes for Raspberry Pi
      translate([raspiOffsetX,raspiOffsetY,raspiOpeningZ])
        rotate([0,0,0]) {
          pi4bOpening(chassisT, 0);
        }
      
      // Opening for display cable
      openingW = 30.0;
      openingD = 4.0;
      translate([0, stopMotionPiD/2 - pcbT/2 - openingD, raspiOpeningZ]) {
        opening(openingW, openingD, chassisT);
      }
      
      // Opening for connectors
      connectorSpace = 0.2;
      plugSpace = 2.0;
      connectorOffsetZ = raspiOffsetZ + pcbT/2 + connectorSpace/2;
      // Ethernet
      translate([stopMotionPiW/2 - 3*chassisT/4, raspiOffsetY + ethernetOffsetD, connectorOffsetZ + ethernetSocketH/2])
        rotate([0, 90, 0])
          cube([ethernetSocketH + connectorSpace, ethernetSocketD + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([stopMotionPiW/2 - chassisT/4, raspiOffsetY + ethernetOffsetD, connectorOffsetZ + ethernetSocketH/2])
        rotate([0, 90, 0])
          cube([ethernetSocketH + connectorSpace + plugSpace, ethernetSocketD + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
      // 1. USB A
      translate([stopMotionPiW/2 - 3*chassisT/4, raspiOffsetY + usbA1OffsetD, connectorOffsetZ + usbADoubleSocketH/2])
        rotate([0, 90, 0])
          cube([usbADoubleSocketH + connectorSpace, usbADoubleSocketD + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([stopMotionPiW/2 - chassisT/4, raspiOffsetY + usbA1OffsetD, connectorOffsetZ + usbADoubleSocketH/2])
        rotate([0, 90, 0])
          cube([usbADoubleSocketH + connectorSpace + plugSpace, usbADoubleSocketD + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
      // 2. USB A
      translate([stopMotionPiW/2 - 3*chassisT/4, raspiOffsetY + usbA2OffsetD, connectorOffsetZ + usbADoubleSocketH/2])
        rotate([0, 90, 0])
          cube([usbADoubleSocketH + connectorSpace, usbADoubleSocketD + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([stopMotionPiW/2 - chassisT/4, raspiOffsetY + usbA2OffsetD, connectorOffsetZ + usbADoubleSocketH/2])
        rotate([0, 90, 0])
          cube([usbADoubleSocketH + connectorSpace + plugSpace, usbADoubleSocketD + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
      // Micro USB
      translate([raspiOffsetX + microUsbOffsetW, -stopMotionPiD/2 + 3*chassisT/4, connectorOffsetZ + usbMicroSocketH/2])
        rotate([90, 0, 0])
          cube([usbMicroSocketD + connectorSpace, usbMicroSocketH + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([raspiOffsetX + microUsbOffsetW, -stopMotionPiD/2 + chassisT/4, connectorOffsetZ + usbMicroSocketH/2])
        rotate([90, 0, 0])
          cube([usbMicroSocketD + connectorSpace + plugSpace, usbMicroSocketH + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
      // 1. Micro HDMI
      translate([raspiOffsetX + microHdmi1OffsetW, -stopMotionPiD/2 + 3*chassisT/4, connectorOffsetZ + hdmiMicroSocketH/2])
        rotate([90, 0, 0])
          cube([hdmiMicroSocketD + connectorSpace, hdmiMicroSocketH + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([raspiOffsetX + microHdmi1OffsetW, -stopMotionPiD/2 + chassisT/4, connectorOffsetZ + hdmiMicroSocketH/2])
        rotate([90, 0, 0])
          cube([hdmiMicroSocketD + connectorSpace + plugSpace, hdmiMicroSocketH + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
      // 2. Micro HDMI
      translate([raspiOffsetX + microHdmi2OffsetW, -stopMotionPiD/2 + 3*chassisT/4, connectorOffsetZ + hdmiMicroSocketH/2])
        rotate([90, 0, 0])
          cube([hdmiMicroSocketD + connectorSpace, hdmiMicroSocketH + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([raspiOffsetX + microHdmi2OffsetW, -stopMotionPiD/2 + chassisT/4, connectorOffsetZ + hdmiMicroSocketH/2])
        rotate([90, 0, 0])
          cube([hdmiMicroSocketD + connectorSpace + plugSpace, hdmiMicroSocketH + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
      // Audio
      translate([raspiOffsetX + audioOffsetW, -stopMotionPiD/2 + 3*chassisT/4, connectorOffsetZ + audioSocketH/2])
        rotate([90, 0, 0])
          cube([audioSocketD + connectorSpace, audioSocketH + connectorSpace, chassisT/2 + 0.2], center=true);
      translate([raspiOffsetX + audioOffsetW, -stopMotionPiD/2 + chassisT/4, connectorOffsetZ + audioSocketH/2])
        rotate([90, 0, 0])
          cube([audioSocketD + connectorSpace + plugSpace, audioSocketH + connectorSpace + plugSpace, chassisT/2 + 0.2], center=true);
    }
  }
  
  // Render devices?
  if (withDevices) {
    // Raspberry 4
    translate([raspiOffsetX, raspiOffsetY, raspiOffsetZ])
      rotate([0, 0, 0])
        pi4B();
    
    // Pico HV30B
    piusvOffsetZ = raspiOffsetZ + 14;
    translate([raspiOffsetX - pi4bHoleDC, raspiOffsetY, piusvOffsetZ])
      rotate([0, 0, 0])
        upsPicoHv30Bplus(true);
  }
}

module stopMotionPiBack(withDevices = false)
{
  color("silver") {
    difference() {
      // Outer hull
      hull() {
        translate([ stopMotionPiW/2-stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiBackH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
        translate([ stopMotionPiW/2-stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiBackH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
        translate([-stopMotionPiW/2+stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiBackH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
        translate([-stopMotionPiW/2+stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0]) {
          translate([0,0,-(stopMotionPiBackH-stopMotionPiT)/2])
            donut(stopMotionPiR, stopMotionPiR-stopMotionPiT);
          translate([0,0,stopMotionPiT/2])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR, center=true);
        }
      }
      
      // Inner hull
      translate([0,0,stopMotionPiT/2+0.1]) {
        hull() {
          translate([ stopMotionPiW/2-stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([ stopMotionPiW/2-stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([-stopMotionPiW/2+stopMotionPiR,-stopMotionPiD/2+stopMotionPiR,0])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
          translate([-stopMotionPiW/2+stopMotionPiR, stopMotionPiD/2-stopMotionPiR,0])
            cylinder(h=stopMotionPiBackH-stopMotionPiT, r=stopMotionPiR-stopMotionPiT, center=true);
        }
      }
      
      // Boreholes over Raspberry Pi boreholes
      translate([raspiOffsetX - pi3bHoleDC, -raspiOffsetY, 0]) {
        translate([0, 0, -stopMotionPiBackH/2 + stopMotionPiT/2])
          boreholes(pi4bHoleX, pi4bHoleY, pi4bHoleD, stopMotionPiT + 0.2);
        translate([0, 0, -stopMotionPiBackH/2])
          boreholes(pi4bHoleX, pi4bHoleY, 2*pi4bHoleD, holeH);
      }
      
      translate([raspiOffsetX - pi4bHoleDC + picoFanOffsetW, -raspiOffsetY - picoFanOffsetD, -stopMotionPiBackH/2 + stopMotionPiT/2])
        picoFanOpening(5, 4.0);
    }
  }
  
  // Render devices?
  if (withDevices) {
    
  }
}

// ==============================================================================================

if(displayFront) {
  stopMotionPiFront(displayDevices);
}
if(displayChassis) {
  stopMotionPiChassis(displayDevices);
}
if(displayBack) {
  stopMotionPiBack(displayDevices);
}
if(displayAll) {
  translate([0, 0, 0])
    rotate([0, 0, 180])
      stopMotionPiBack(false);

  translate([0, 0, stopMotionPiBackH/2 + stopMotionPiChassisH/2 + 1])
    rotate([0, 180, 0])
      stopMotionPiChassis(displayDevices);

  translate([0, 0, stopMotionPiBackH/2 + stopMotionPiChassisH + stopMotionPiFrontH/2 + 2])
    rotate([0, 180, 0])
      stopMotionPiFront(displayDevices);
}
if(displayImage) {
  translate([(stopMotionPiD+10), 0, 0])
    rotate([0, 0, 90])
      stopMotionPiBack(false);

  translate([0, 0, 0])
    rotate([0, 0, 90])
      stopMotionPiChassis(false);

  translate([-(stopMotionPiD+10), 0, 0])
    rotate([0, 0, 90])
      stopMotionPiFront(false);
}
