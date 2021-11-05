// ========================================
// Raspberry Pi Zero board modules
// (c) 2021, Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Pi0Constants.scad>
include <../parts/PartConstants.scad>

// External modules
use <PiPcbs.scad>
use <../parts/Parts.scad>

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

  // Mini HDMI socket
  translate([miniHdmiOffsetW, miniHdmiOffsetD, miniHdmiOffsetZ])
    rotate([0, 0, -90])
      hdmiMiniSocket(detail);

  // 1. Micro USB socket
  translate([microUsb1OffsetW, microUsb1OffsetD, microUsb1OffsetZ])
    rotate([0, 0, -90])
      usbMicroSocket(detail);
  // Label
  translate([3.8, -13, pcbT/2]) {
    rotate([0, 0, 90])
      color("white") linear_extrude(height=0.1)
        text("USB", size=1, halign="center", valign="center");
  }

  // 2. Micro USB power socket
  translate([microUsb2OffsetW, microUsb2OffsetD, microUsb2OffsetZ])
    rotate([0, 0, -90])
      usbMicroSocket(detail);
  // Label
  translate([16.8, -12, pcbT/2]) {
    rotate([0, 0, 90])
      color("white") linear_extrude(height=0.1)
        text("PWR IN", size=1, halign="center", valign="center");
  }

  // Camera ribbon cable
  translate([cameraOffsetW, cameraOffsetD, cameraOffsetZ])
    rotate([0, 0, 90])
      connectRibbonHorizontal(cameraRibbonW, detail);

  // Micro SD Card
  translate([sdCardOffsetW, sdCardOffsetD, sdCardOffsetZ])
    rotate([0, 0, 180])
      microSDCardSlot(detail);
}

if(displayPi0) {
  $fn=100;

  pi0(header ? (headerDown ? -1 : 1) : 0);
}
