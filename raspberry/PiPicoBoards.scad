// ========================================
// Raspberry Pi Pico board modules
// (c) 2021, Ralf Lange, longsoft.de
// ========================================

// External definitions
include <PiPicoConstants.scad>
include <PiPcbConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../parts/Parts.scad>
use <PiPcbs.scad>

// Which one would you like to see?
displayPiPico = true;     // Raspberry PI Picoo

detail = 1;

// Show Header
header = true;      // true: Show Header; false:Don't show Header

// Header Up/Down
headerDown = false; // true: Header down (Only Zero); false: Header up

// header: 0 no, 1= up, -1, down
module piPico(header = 0)
{
  // PCB
  piPicoPcb(true);

  // Micro USB power socket
  translate([piPicoPcbW/2-usbMicroSocketW/2+1, 0, 0])
    usbMicroSocket(detail);
  // Label
  translate([19.5, 0, pcbT/2]) {
    rotate([0,0,-90])
      color("white") linear_extrude(height=0.1)
        text("USB", size=1, halign="center", valign="center");
  }

  // Label
  translate([-12.5, 6, pcbT/2]) {
    color("white") linear_extrude(height=0.1)
      text("Raspberry Pi Pico (c) 2020", size=1, halign="center", valign="center");
  }
}

if(displayPiPico) {
  $fn=100;

  piPico(header ? (headerDown ? -1 : 1) : 0);
}
