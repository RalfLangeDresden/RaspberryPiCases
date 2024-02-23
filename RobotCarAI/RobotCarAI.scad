// ========================================
// PobotCarAI Parts
// Version 1
// (c) Ralf Lange, longsoft.de
// Last update: 2024-02-22
// ========================================

use <../parts/Geometrics.scad>
use <../raspberry/PiOpenings.scad>
use <../raspberry/PiParts.scad>
use <../raspberry/PiPcbs.scad>
use <../raspberry/Pi4Boards.scad>
use <../raspberry/PiCameraBoards.scad>

include <RobotCarAIConstants.scad>
include <../parts/PartConstants.scad>
include <../raspberry/PiPcbConstants.scad>
include <../raspberry/PiPartConstants.scad>
include <../raspberry/Pi4Constants.scad>

displaySensorMount = true;   // Sensor mount part
displayCameraMount = false;   // Camera mount part 1 and 2
displayCameraMount1 = false;  // Camera mount part 1
displayCameraMount2 = false;  // Camera mount part 2
displayAll = false;           // All parts together
displayImage = false;         // All parts together in one image

displayDevices = true;
withThread = false;

// Details of the drawing (larger is better)
$fn = 100;
transparency = 0.5;  // 1.0 is opace

module SensorMount(boreholeD = 0.0, boreholeR = 1.1)
{
  difference() {
    color("yellow") {
      cube([ SensorMountW, SensorMountD, SensorMountH], center=true);
      translate([ 0, 4.5, 2.5])
        rotate([ 0, 90, 0])
          difference() {
            cylinder(h=SensorMountW, d=7, center = true);
            cylinder(h=SensorMountW+0.1, d=3, center = true);
          }
        }
    translate([ 7.5, 4.5, 2.5])
      rotate([ 0, 90, 0])
        cylinder(h=5.1, d=7.1, center = true);
    translate([-2.5, 4.5, 2.5])
      rotate([ 0, 90, 0])
        cylinder(h=5.1, d=7.1, center = true);
    translate([-9.5, 4.5, 2.5])
      rotate([ 0, 90, 0])
        cylinder(h=1.1, d=7.1, center = true);
    if (boreholeD > 0.0) {
      diameter = 2*boreholeR;
      distanceX = boreholeD/2;
      distanceY = boreholeR+1;
      translate([+distanceX,-distanceY,0])
        cylinder(h=SensorMountH+0.1, d=diameter, center=true);
      translate([-distanceX,-distanceY,0])
        cylinder(h=SensorMountH+0.1, d=diameter, center=true);
    }
  }
}

module CameraMount1(withDevices=false)
{
  difference() {
    union() {
      translate([ -pi4bHoleDC, 0, 0])
        pi3HatPcb(true, true, 8.55, false, false);
      translate([ -pi4bPcbW/2+SensorMountH, -pi4bPcbD/2, -pcbT/2])
        rotate([ 0, 0, 90])
          ramp(pi4bPcbD-10, SensorMountH, 27, 20, false);
      translate([ -pi4bPcbW/2+pcbT, -pi4bPcbD/2, -pcbT/2])
        rotate([ 0, 0, 0])
          ramp(20, pcbT, 27, 2, false);
      translate([ -pi4bPcbW/2+pcbT/2+0.3, -14, 26+pcbT/2])
        rotate([ 90, 0, 90])
          SensorMount();
      translate([ -pi4bPcbW/2+4.5, -16, 14])
        cube([ 5, SensorMountW-6, 28], center=true);
      translate([ -pi4bPcbW/2+4.5, -21, 30])
        rotate([ 0, 0, 180])
          ramp(5, 4, 4, 0.1, true);
      translate([ -pi4bPcbW/2+4.5, -11.5, 30])
        rotate([ 0, 0, 180])
          ramp(5, 5, 4, 0.1, true);
    }
    // Air opening
    translate([ socOffsetW, socOffsetD, 0])
      cylinder(h=piFanH+0.1, d=piFanAirOpeningD, center=true);
    // Header opening
    socketX = 2.54 * 20;
    socketY = 2.54 * 2;
    translate([ -pi4bHoleDC, (pi3HatPcbD - socketY)/2, 0])
      cube([ socketX, socketY + 0.1, pcbT + 0.1], center=true);
  }
  
  if (withDevices) {
    translate([ socOffsetW, socOffsetD, (pcbT + piFanH)/2])
      piFan();
    translate([ 0, 0, -(pcbT + 20)])
      pi4B();
  }
}

module CameraMount2(withDevices=false)
{
  difference() {
    union() {
      translate([ 0, 0, 0])
        rotate([ 0, 0, 90])
          SensorMount();
      translate([ 12, 0, 0])
        cube([ 24, 28, SensorMountH], center=true);
    }
    translate([ 12, 0, 0])
      rotate([ 0, 0, 0])
        piCameraV3Boreholes(SensorMountH + 0.1);
    translate([ 24, 0, 0])
      cube([ 40, 16, SensorMountH + 0.1], center=true);
  }
  
  if (withDevices) {
    translate([ 16, 0, 2])
      rotate([ 180, 0, 0])
        piCameraV3();
  }
}

if (displaySensorMount) {
  SensorMount(12);
  
  if (displayDevices) {
    translate([ 0, SensorMountD-1, 0])
      rotate([ 0, 0, 180])
        SensorMount(10);
  }
}
if (displayCameraMount1) {
  CameraMount1(false);
}
if (displayCameraMount2) {
  CameraMount2(false);
}
if (displayCameraMount) {
  CameraMount1(displayDevices);
  translate([ -pi4bPcbW/2+pcbT/2+0.3, -14, 25+pcbT/2+SensorMountD])
    rotate([ 0, -90, 180])
      CameraMount2(displayDevices);
  // translate([ -pi4bPcbW/2, -pi4bPcbD/2-2, 0])
  //   color("red")
  //     cube([ 6, 1, 40], center=false);
}
if (displayAll) {
  
  if (!displayDevices) {
  }
  
  translate([ 0, 0, 0])
    rotate([ 0, 0, 0])
      SensorMount(displayDevices);

  translate([ 0, 7.0, 7.0])
    rotate([ -90, 0, 180])
      SensorMount(false);
}
if (displayImage) {
  translate([ (caseD+10), 0, 0])
    rotate([ 0, 0, 90])
      SensorMount(false);

  translate([ 0, 0, 0])
    rotate([ 0, 0, 90])
      SensorMount(false);
}
