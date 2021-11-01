// ========================================
// Raspberry Pi 3 Model B+
// Board modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Pi3Constants.scad>
include <../parts/PartConstants.scad>

// External modules
use <PiPcbs.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayPi3Bplus = true;    // Raspberry PI3 B+
displayPi3_Pi3Hat = false;  // Raspberry PI3 & HAT board

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink

module pi3Bplus()
{
  // PCB
  pi3bPcb(true);

  // Label
  translate([-8,18,pcbT/2]) {
    color("white") linear_extrude(height=0.1)
      text("Raspberry Pi 3 Model B+", size=2, halign="center", valign="center");
  }
  translate([-11, -13, pcbT/2]) {
    color("white") linear_extrude(height=0.1)
      text("HDMI", size=3, halign="center", valign="center");
  }

  // Logo
  translate([8, 7, pcbT/2-0.4]) {
    color("white")
      import(file = "./RaspberryPiLogo.dxf", scale = 0.04);
  }

  // micro USB socket
  translate([microUsbOffsetW, microUsbOffsetD, microUsbOffsetZ])
    rotate([0, 0, -90])
      usbMicroSocket(detail);

  // HDMI socket
  translate([hdmiOffsetW, hdmiOffsetD, hdmiOffsetZ])
    rotate([0, 0, -90])
      hdmiSocket(detail);

  // Camera connector
  translate([cameraOffsetW, cameraOffsetD, cameraOffsetZ])
    rotate([0, 0, 90])
      connectRibbonVertical(cameraRibbonW, detail);

  // Audio
  translate([audioOffsetW, audioOffsetD, audioOffsetZ])
    rotate([0, 0, -90])
      audioSocket(detail);

  // Ethernet
  translate([ethernetOffsetW, ethernetOffsetD, ethernetOffsetZ])
    ethernetSocket(detail);

  // USB sockets
  translate([usbA1OffsetW, usbA1OffsetD, usbA1OffsetZ])
    usbASocketDouble(detail);
  translate([usbA2OffsetW, usbA2OffsetD, usbA2OffsetZ])
    usbASocketDouble(detail);

  // Display connector
  translate([displayOffsetW, displayOffsetD, displayOffsetZ])
    rotate([0, 0, -90])
      connectRibbonVertical(displayRibbonW, detail);

  // Micro SD Card
  translate([sdCardOffsetW, sdCardOffsetD, sdCardOffsetZ])
    rotate([0, 180, 0])
      microSDCardSlot(detail);

  // Processor
  translate([-pi3bPcbW/2+27,-pi3bPcbD/2+31,0])
    bcm2837(heatSink, detail);

  // GBit LAN and USB
  translate([18,0,0])
    lan7515(heatSink, detail);

  // Power supply
  translate([-pi3bPcbW/2+10,-pi3bPcbD/2+11,0])
    mxl7704(heatSink, detail);

  // WLAN and Bluetooth
  translate([-pi3bPcbW/2+12,-pi3bPcbD/2+42,0])
    cyw43455(detail);
}

if(displayPi3Bplus == true) {
  $fn=100;

  pi3Bplus();
}
if(displayPi3_Pi3Hat == true) {
  $fn=100;

  pi3Bplus();
  translate([-pi3bHoleDC, 0, 12])
    pi3HatPcb(true, true, 8.55, header);
}
