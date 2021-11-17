// ========================================
// Raspberry Pi HAT Modules
// Board modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <../raspberry/PiPcbConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../raspberry/PiPcbs.scad>
use <../raspberry/PiParts.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayPiSense = true;    // Template

// Show Header
header = true; // true: Show Header; false:Don't show Header

module piSense(withHeader=false)
{
  pi3HatPcb(true, true);
  
  ledW = 2.8;
  ledD = 2.8;
  ledH = 2.0;
  ledDeltaX = 1.26;
  ledDeltaY = 1.70;

  // LED matrix
  translate([0, 0, pcbT/2 + ledH/2])
    for(y = [0 : 1 : 7])
      for(x = [0 : 1 : 7]) {
        offsetX = -pi3HatPcbW/2 + 7.0 + ledW/2 + x * (ledW + ledDeltaX);
        offsetY = pi3HatPcbD/2 - 10.0 - ledD/2 - y * (ledD + ledDeltaY);
        translate([offsetX, offsetY, 0])
          cube([ledW, ledD, ledH], center = true);
      }
      
  /*
  translate([-pi3HatPcbW/2 + 7.0 + 31.35/2, 0, pcbT/2])
    cube([31.35, 2, 2], center = true);
  
  translate([0, pi3HatPcbD/2 - 10.0 - 34.27/2, pcbT/2])
    cube([2, 34.27, 2], center = true);
  */
  
  // Joystrick
  joystickSocketW = 7.4;
  joystickSocketD = 7.4;
  joystickSocketH = 1.0;
  joystickCylinderH = 3.0;
  joystickPinD = 2.3;
  joystickPinH = 3.0;
      
  translate([-pi3HatPcbW/2 + 53.5, pi3HatPcbD/2 - 48.6, pcbT/2]) {
    color("silver") {
      translate([0, 0, joystickSocketH/2])
        rotate([0, 0, 45.0])
          cube([joystickSocketW, joystickSocketD, joystickSocketH], center = true);
      translate([0, 0, joystickSocketH + joystickCylinderH/2])
        cylinder(h = joystickCylinderH, r1 = 7.4/2, r2 = 3.68/2, center = true);
    }
    color("black")
      translate([0, 0, joystickSocketH + joystickCylinderH + joystickPinH/2])
        cylinder(h = joystickPinH, r = joystickPinD/2, center = true);
  }
  
  // Header top
  translate([0, pi3HatPcbD/2-pi3HatHoleDY, pcbT/2])
    rotate([0, 0, 0])
      headerFemale(20, 2, 2.0);

}

if(displayPiSense == true) {
  $fn=100;

  piSense(header);
}
