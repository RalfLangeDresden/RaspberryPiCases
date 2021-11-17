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
use <PiModules.scad>
use <PiSense.scad>

// Which one would you like to see?
displayImage = true;        // Raspberry Pi Images

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
fan = true;       // true: Show Fan
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink


if(displayImage == true) {
  $fn=100;

  translate([-pi3HatPcbW/2 - 10.0, pi3HatPcbD/2 + 10.0, 0]) {
    // HifiBerry
    translate([0, 0, 0]) {
      piSense(header);
    }
  }

  translate([pi3HatPcbW/2 + 10.0, pi3HatPcbD/2 + 10.0, 0]) {
    // HifiBerry
    translate([0, 0, 0]) {
      hifiBerryDacPlus(header);
    }
  }

  translate([-pi3HatPcbW/2 - 10.0, -pi3HatPcbD/2-10.0, 0]) {
    // Pi USV Plus
    translate([0, 0, 0]) {
      piUsvPlus(header);
    }
  }

  translate([pi3HatPcbW/2 + 10.0, -pi3HatPcbD/2 - 10.0, 0]) {
    // Pi USV Plus
    translate([0, 0, 0]) {
      upsPicoHv30Bplus(fan);
    }
  }
}
