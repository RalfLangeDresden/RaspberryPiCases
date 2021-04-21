// ========================================
// Raspberry Pi 4 Model B
// Board modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Pi4Constants.scad>
include <PiPcbConstants.scad>
include <PiParts.scad>
// include <../parts/PartConstants.scad>

// External modules
use <PiPcbs.scad>

// Which one would you like to see?
displayPi4B = true;        // Raspberry Pi4 Model B
displayPi4_Pi3Hat = false;  // Raspberry Pi4 & HAT board

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink

module pi4B()
{
  // PCB
  pi4bPcb(true);

  // Label
  translate([0,15,pcbT/2]) {
    color("white") linear_extrude(height=0.1)
      text("Raspberry Pi 4 Model B", size=2, halign="center", valign="center");
  }

  // Ethernet
  translate([pi4bPcbW/2-8.5,-pi4bPcbD/2+10.25,0])
    ethernetSocket(detail);

  // USB sockets
  translate([pi4bPcbW/2-7, -pi4bPcbD/2+29,0])
    usbASocketDouble(detail);
  translate([pi4bPcbW/2-7, -pi4bPcbD/2+47,0])
    usbASocketDouble(detail);

  // micro USB socket
  translate([-pi4bPcbW/2+11.2,-pi4bPcbD/2+1.5,0])
    rotate([0,0,-90])
      usbMicroSocket(detail);

  // 1. HDMI socket
  translate([-pi4bPcbW/2+26,-pi4bPcbD/2+2,0])
    rotate([0,0,-90])
      hdmiMicroSocket(detail);

  // 2. HDMI socket
  translate([-pi4bPcbW/2+39.5,-pi4bPcbD/2+2,0])
    rotate([0,0,-90])
      hdmiMicroSocket(detail);

  // Camera connector
  translate([-pi4bPcbW/2+46.5,-pi4bPcbD/2+11.5,0])
    rotate([0,0,90])
      connectorFoilCable(detail);

  // Audio
  translate([-pi4bPcbW/2+54,-pi4bPcbD/2+5,0])
    rotate([0,0,-90])
      audioSocket(detail);

  // Display connector
  translate([-pi4bPcbW/2+3.5,-pi4bPcbD/2+28,0])
    rotate([0,0,-90])
      connectorFoilCable(detail);

  // Micro SD Card
  translate([-pi4bPcbW/2+13/2,0,0])
    rotate([0,180,0])
      microSDCardSlot(detail);

  // Processor
  translate([-pi4bPcbW/2+27,-pi4bPcbD/2+31,0])
    bcm2837B0(heatSink, detail);

  // GBit LAN and USB
  translate([18,0,0])
    lan7515(heatSink, detail);

  // ???
  translate([-pi4bPcbW/2+10,-pi4bPcbD/2+11,0])
    mxl7704(heatSink, detail);

  // WLAN and Bluetooth
  translate([-pi4bPcbW/2+12,-pi4bPcbD/2+42,0])
    cyw43455(detail);
}

if(displayPi4B == true) {
  $fn=100;

  pi4B();
}
if(displayPi4_Pi3Hat == true) {
  $fn=100;

  pi4B();
  translate([-pi4bHoleDC, 0, 12])
    pi3HatPcb(true, true, 8.55, header);
}
