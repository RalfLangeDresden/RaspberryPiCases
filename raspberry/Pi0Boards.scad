// ========================================
// Raspberry Pi Zero board modules
// (c) 2021, Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Pi0Constants.scad>
include <PiPcbConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../parts/Parts.scad>
use <PiPcbs.scad>

// Which one would you like to see?
// pi0 ==> Raspberry PI Zero
displayPi0 = true;

detail = 1;

// Show Header
header = true;      // true: Show Header; false:Don't show Header

// Header Up/Down
headerDown = false; // true: Header down (Only Zero); false: Header up

// header: 0 no, 1= up, -1, down
module pi0(header = 0)
{
  // PCB
  pi0Pcb(true);

  // Micro SD Card
  translate([13/2-pi0PcbW/2+1,16.9-pi0PcbD/2,0])
    rotate([0,0,180])
      microSDCardSlot(detail);

  // Mini HDMI socket
  translate([-pi0PcbW/2+12.4,-(pi0PcbD-hdmiMiniSocketW)/2-0.5,0])
    rotate([0,0,-90])
      hdmiMiniSocket(detail);

  // Micro USB socket
  translate([41.4-pi0PcbW/2, -(pi0PcbD-usbMicroSocketW)/2-0.5, 0])
    rotate([0,0,-90])
      usbMicroSocket(detail);
  // Label
  translate([3.8,-13,pcbT/2]) {
    rotate([0,0,90])
      color("white") linear_extrude(height=0.1)
        text("USB", size=1, halign="center", valign="center");
  }

  // Micro USB power socket
  translate([54-pi0PcbW/2, -(pi0PcbD-usbMicroSocketW)/2-0.5, 0])
    rotate([0,0,-90])
      usbMicroSocket(detail);
  // Label
  translate([16.8,-12,pcbT/2]) {
    rotate([0,0,90])
      color("white") linear_extrude(height=0.1)
        text("PWR IN", size=1, halign="center", valign="center");
  }


  // Camera fail cable
  translate([(pi0PcbW-5.5)/2,0,0])
    rotate([0,0,90])
      connectFoilCable17(detail);
}

if(displayPi0) {
  $fn=100;

  pi0(header ? (headerDown ? -1 : 1) : 0);
}
