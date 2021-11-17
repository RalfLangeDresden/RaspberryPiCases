// ========================================
// Modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <PartConstants.scad>

// External modules
use <Parts.scad>

// Which one would you like to see?
displayAdafruit3548 = false;         // HDMI plug
displayAdafruit3549 = false;         // HDMI plug 90 degree
displaySdrStick = false;             // SDR USB Stick
displayLipo2500 = false;             // LIPO785060
displayXxx = false;

detail = 1;
heatSink = true;
$fn=100;

// Show Header
// header = true; // true:Show Header;false:Don't show Header

// Header Up/Down for Pi Zero
// headerDown = false; //true: Header down (Only Zero): false Header up

module adafruit3548(detail = 1)
{
  pcbW = 15;
  pcbD = 17.3;
  connector = 2.5;

  translate([hdmiPlugW/2,0,0])
    hdmiPlug(detail);
  translate([-pcbW/2,0,0])
    cube([pcbW,pcbD,pcbT], center=true);
  translate([-pcbW+connector,0,pcbT/2+connector/2])
    color("white")
      cube([connector,pcbD-2,connector], center=true);
}

module adafruit3549(detail = 1)
{
  pcbW = 19;
  pcbD = 17;
  connector = 2.5;

  translate([hdmiPlugW/2,0,0])
    hdmiPlug(detail);
  translate([-pcbT/2,0,pcbW/2-4])
    cube([pcbT,pcbD,pcbW], center=true);
  translate([-(pcbT+connector/2),0,pcbW-connector-4])
    color("white")
      cube([connector,pcbD-2,connector], center=true);
}

module sdrStick()
{
  bodyW = 67.8;
  stepW = 3.0;
  usbW = 13.7;

  cube([bodyW,28.0,14.0], center=true);
  translate([bodyW/2+stepW/2,0,0])
    cube([stepW,25.0,10.0], center=true);

  // USB port
  translate([bodyW/2+stepW+usbW/2,0,0])
    cube([usbW,12.0,5.0], center=true);
}

module sdrStick2()
{
  // cube([69.0,28.0,14.0], center=true);

  stickL = 67.71;
  stickL2 = 3;

  translate([-stickL/2-0.24/2,0,0])
    rotate([0,90,0])
      color("silver")
        cylinder(d=10.4,h=0.24, center=true);

  cubePoints = [
    [ stickL/2,      0, 13.3/2],   // USB port side (0)
    [ stickL/2, 27.8/2,  9.0/2],
    [ stickL/2, 27.8/2, -9.0/2],
    [ stickL/2,      0,-13.3/2],
    [ stickL/2,-27.8/2, -9.0/2],
    [ stickL/2,-27.8/2,  9.0/2],
    [-stickL/2,      0, 15.3/2],   // Antenna port side (6)
    [-stickL/2, 30.0/2, 11.5/2],
    [-stickL/2, 30.0/2,-11.5/2],
    [-stickL/2,      0,-15.3/2],
    [-stickL/2,-30.0/2,-11.5/2],
    [-stickL/2,-30.0/2, 11.5/2]];  // (11)

  cubeFaces = [
    [0,1,2,3,4,5],  // USB port side
    [1,0,6,7],
    [2,1,7,8],
    [3,2,8,9],
    [4,3,9,10],
    [5,4,10,11],
    [0,5,11,6],
    [6,7,8,9,10,11]];  // Antenna port side

  polyhedron(cubePoints,cubeFaces);

  cubePoints2 = [
    [ stickL2/2,      0, 10.0/2],   // USB port side (0)
    [ stickL2/2, 24.3/2,  6.5/2],
    [ stickL2/2, 24.3/2, -6.5/2],
    [ stickL2/2,      0,-10.0/2],
    [ stickL2/2,-24.3/2, -6.5/2],
    [ stickL2/2,-24.3/2,  6.5/2],
    [-stickL2/2,      0, 10.0/2],   // Antenna port side (6)
    [-stickL2/2, 24.3/2,  6.5/2],
    [-stickL2/2, 24.3/2, -6.5/2],
    [-stickL2/2,      0,-10.0/2],
    [-stickL2/2,-24.3/2, -6.5/2],
    [-stickL2/2,-24.3/2,  6.5/2]];  // (11)

  translate([stickL/2+stickL2/2,0,0])
    polyhedron(cubePoints2,cubeFaces);

  // USB port
  translate([stickL/2+stickL2+13.7/2,0,0])
    color("silver")
      cube([13.7,12.0,4.5], center=true);
}

module lipo2500()
{
  color("black")
    cube([63.0,50.3,8.1], center = true);
}

// ==============================================================================================

if(displayAdafruit3548) {
  adafruit3548(detail);
}
if(displayAdafruit3549) {
  adafruit3549(detail);
}
if(displaySdrStick) {
  sdrStick2();
}
if(displayLipo2500) {
  lipo2500();
}
