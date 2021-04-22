// ========================================
// Raspberry Pi 3 Model B+
// Board modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Pi3Constants.scad>
include <PiPcbConstants.scad>
include <PiParts.scad>
// include <../parts/PartConstants.scad>

// External modules
use <PiPcbs.scad>

// Which one would you like to see?
displayPi3Bplus = false;    // Raspberry PI3 B+
displayPi3_Pi3Hat = true;  // Raspberry PI3 & HAT board

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink

module pi3Bplus()
{
  // PCB
  pi3bPcb(true);

  // Label
  translate([0,15,pcbT/2]) {
    color("white") linear_extrude(height=0.1)
      text("Raspberry Pi 3 Model B+", size=2, halign="center", valign="center");
  }

  // Ethernet
  translate([pi3bPcbW/2-8.5,-pi3bPcbD/2+10.25,0])
    ethernetSocket(detail);

  // USB sockets
  translate([pi3bPcbW/2-7, -pi3bPcbD/2+29,0])
    usbASocketDouble(detail);
  translate([pi3bPcbW/2-7, -pi3bPcbD/2+47,0])
    usbASocketDouble(detail);

  // micro USB socket
  translate([-pi3bPcbW/2+10.6,-pi3bPcbD/2+1.5,0])
    rotate([0,0,-90])
      usbMicroSocket(detail);

  // HDMI socket
  translate([-pi3bPcbW/2+32,-pi3bPcbD/2+4,0])
    rotate([0,0,-90])
      hdmiSocket(detail);

  // Camera connector
  translate([-pi3bPcbW/2+46.5,-pi3bPcbD/2+11.5,0])
    rotate([0,0,90])
      connectorFoilCable(detail);

  // Audio
  translate([-pi3bPcbW/2+54,-pi3bPcbD/2+5,0])
    rotate([0,0,-90])
      audioSocket(detail);

  // Display connector
  translate([-pi3bPcbW/2+3.5,-pi3bPcbD/2+28,0])
    rotate([0,0,-90])
      connectorFoilCable(detail);

  // Micro SD Card
  translate([-pi3bPcbW/2+13/2,0,0])
    rotate([0,180,0])
      microSDCardSlot(detail);

  // Processor
  translate([-pi3bPcbW/2+27,-pi3bPcbD/2+31,0])
    bcm2837B0(heatSink, detail);

  // GBit LAN and USB
  translate([18,0,0])
    lan7515(heatSink, detail);

  // ???
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
