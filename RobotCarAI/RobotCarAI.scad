// ========================================
// PobotCarAI Parts
// Version 1
// (c) Ralf Lange, longsoft.de
// ========================================

use <../raspberry/PiOpenings.scad>
use <../raspberry/PiParts.scad>
use <../raspberry/PiPcbs.scad>
use <../raspberry/Pi4Boards.scad>

include <../parts/PartConstants.scad>
include <../raspberry/PiPcbConstants.scad>
include <../raspberry/PiPartConstants.scad>
include <../raspberry/Pi4Constants.scad>

displaySensorMount = false;   // Sensor mount part
displayCameraMount = true;   // Camera mount part
displayAll = false;           // All parts together
displayImage = false;         // All parts together in one image

displayDevices = true;
withThread = false;

// Details of the drawing (larger is better)
$fn = 100;
transparency = 0.5;  // 1.0 is opace

module SensorMount(withDevices = false)
{
  difference() {
  color("yellow") {
    cube([ 20, 10, 2], center=true);
    translate([ 0, 4.5, 2.5])
      rotate([ 0, 90, 0])
        difference() {
          cylinder(h=20, d=7, center = true);
          cylinder(h=20+0.1, d=3, center = true);
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
    }
}

module CameraMount(withDevices=false)
{
  difference() {
    translate([ -pi4bHoleDC, 0, 0])
      pi3HatPcb(true, true, 8.55, false, false);
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

if (displaySensorMount) {
  SensorMount(displayDevices);
}
if (displayCameraMount) {
  CameraMount(displayDevices);
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
