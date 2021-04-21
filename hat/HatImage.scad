// ========================================
// Raspberry Pi
// All hats image
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <../raspberry/PiPcbConstants.scad>

// External modules
use <HifiBerry.scad>
use <PiUsvPlus.scad>

// Which one would you like to see?
displayImage = true;        // Raspberry Pi Images

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink


if(displayImage == true) {
  $fn=100;

  translate([0, pi3HatPcbD/2+10, 0]) {
    // HifiBerry
    translate([0, 0, 0]) {
      hifiBerry(header);
    }
  }

  translate([0, -pi3HatPcbD/2-10, 0]) {
    // Pi USV Plus
    translate([0, 0, 0]) {
      piUsvPlus(header);
    }
  }
}
