// ========================================
// Raspberry Pi
// All boards image
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <PiPcbConstants.scad>

// External modules
use <Pi0Boards.scad>
use <Pi3Boards.scad>
use <Pi4Boards.scad>
use <PiPicoBoards.scad>
use <PiCameraBoards.scad>

// Which one would you like to see?
displayImage = true;        // Raspberry Pi Images

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink


if(displayImage == true) {
  $fn=100;

  translate([-(pi3bPcbW + pi0PcbW)/2 - 10.0, pi0PcbD/2, 0]) {
    // RaspberryPi Zero
    translate([0, 0, 0]) {
      pi0();
    }
  }

  translate([0, pi3bPcbD/2, 0]) {
    // RaspberryPi 3 Model A
    // translate([-pi3aPcbW/2 -10, 0, 0]) {
    //   pi3aPcb(header);
    // }

    // RaspberryPi 3 Model B / B+
    translate([0, 0, 0]) {
      pi3Bplus();
    }
  }

  translate([(pi3bPcbW + piCameraHqPcbW)/2 + 15.0, piCameraHqPcbD/2, 0]) {
    // Raspberry Camera HQ
    translate([0, 0, 0]) {
      piCameraHq();
    }
  }

  translate([ -(pi4bPcbW + piPicoPcbW)/2 - 10.0, -piPicoPcbD/2 - 10.0, 0]) {
    // RaspberryPi Pico
    translate([0, 0, 0]) {
      piPico();
    }
  }

  translate([0, -pi4bPcbD/2-10, 0]) {
    // RaspberryPi 4 Model B
    translate([0, 0, 0]) {
      pi4B();
    }
  }
}
