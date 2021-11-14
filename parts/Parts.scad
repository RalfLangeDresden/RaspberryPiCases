// ========================================
// Raspberry Pi
// Board parts
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <PartConstants.scad>
include <../raspberry/PiPcbConstants.scad>

// External modules
use <threads.scad>

// Which one would you like to see?
displayHeaderMale = false;             // Male header with x pins in y rows
displayHeaderFemale = false;           // Female header with x pins in y rows
displayEthernetSocket = false;         // Ethernet socket
displayUsbASocketDouble = false;       // USB Series A socket double
displayUsbMicroSocket = false;         // Micro USB socket
displayHdmiSocket = false;             // HDMI socket
displayHdmiPlug = false;               // HDMI plug
displayHdmiMiniSocket = false;         // HDMI mini socket
displayHdmiMicroSocket = false;        // HDMI micro socket
displayAudioSocket = true;            // Audio socket
displayConnectorRibbonVertical = false; // Ribbon cable connector (22mm)
displayConnectorRibbonHorizontal = false; // Ribbon cable connector (17mm)
displayMicroSDCardSlot = false;        // Micro SD card slot
displayBcm2837 = false;                // Broadcom BCM2837, Cortex-A53 (ARMv8) 64-bit SoC @ 1.4GHz
displayBcm2711 = false;                // Broadcom BCM2711, Quad core Cortex-A72 (ARM v8) 64-bit SoC @ 1.5GHz
displaySdRam = false;                  // LPDDR4-3200 SDRAM, 1 GB (??? 4HBMGCJ), 2 GB (Micron D9WHZ), 4 GB (Micron D9WHV), 8 GB ()
displayLan7515 = false;                // GBit LAN and USB ports
displayBcm54213pe = false;             // GBit LAN ports
displayVl805q6 = false;                // USB 3.0 ports
displayCyw43455 = false;               // WLAN & Bluetooth
displayMxl7704 = false;                // 1024 MB LPDDR2 RAM
displayHeatSink = false;               // Heat sink for processor and LAN/USB chip
displayXlrShell = false;               // XLR shell for different ports
displayThreadedSleeve = false;         // Threaded sleeve
displayThreadedSleeveCorner = false;   // Threaded sleeve in a corner
displayThreadedSleeveBorder = false;   // Threaded sleeve on a border
displayScrewNut = false;               // Screw nut
displayBlockBoltHead = false;          // Block bolt hesd
displayChinch = false;                 // Chench socket
displaySdrStick = false;               // SDR USB Stick
displayDonut = false;                  // An "donut" for angles
displayLipo2500 = false;               // LIPO785060
displayAccuNCR18650B = false;          // Accu NCR 18650 B
displayXxx = false;

detail = 1;
heatSink = false;
$fn=100;


// Show Header
// header = true; // true:Show Header;false:Don't show Header

// Header Up/Down for Pi Zero
// headerDown = false; //true: Header down (Only Zero): false Header up

module headerMale(pins, rows, socketZ = 2.00, pinPZ = 6.55, details = 1)
{
  socketX = 2.54*pins;
  socketY = 2.54*rows;
  ;
  // pinPZ = Length of the pin on the top side of the socket
  pinNZ = 2.00;     // Length of the pin on the bottom side of the socket

  translate([0,0,socketZ/2])
    color("black")
      cube([socketX,socketY,socketZ], center=true);

  translate([0,0,socketZ+pinPZ/2])
    for(x=[0:pins-1],y=[0:rows-1]) {
      translate([-socketX/2+x*2.54+2.54/2,-socketY/2+y*2.54+2.54/2,0])
        cube([0.6,0.6,pinPZ], center=true);
    }

  translate([0,0,-pinNZ/2])
    for(x=[0:pins-1],y=[0:rows-1]) {
      translate([-socketX/2+x*2.54+2.54/2,-socketY/2+y*2.54+2.54/2,0])
        cube([0.6,0.6,pinNZ], center=true);
    }
}

module headerFemale(pins, rows, socketZ = 8.55, details = 1)
{
  socketX = 2.54*pins;
  socketY = 2.54*rows;
  pinNZ = 2.00;     // Length of the pin on the bottom side of the socket

  translate([0,0,socketZ/2]) {
    difference() {
      color("black")
        cube([socketX,socketY,socketZ], center=true);

      for(x=[0:pins-1],y=[0:rows-1]) {
        translate([-socketX/2+x*2.54+2.54/2,-socketY/2+y*2.54+2.54/2,0])
          cube([1,1,socketZ], center=true);
      }
    }
    for(x=[0:pins-1],y=[0:rows-1]) {
      translate([-socketX/2+x*2.54+2.54/2,-socketY/2+y*2.54+2.54/2,-(socketZ+pinNZ)/2])
        cube([0.6,0.6,pinNZ], center=true);
    }
  }
}

module ethernetSocket(details = 1)
{
  translate([0, 0, pcbT/2 + ethernetSocketH/2]) {
    difference() {
      color("silver")
        cube([ethernetSocketW, ethernetSocketD, ethernetSocketH], center=true);
      translate([0.5, 0, 1])
        color("black")
          cube([20.1, 15, 8], center=true);
      translate([0.5, 0, -4])
        color("black")
          cube([20.1, 6, 2], center=true);
    }
  }
}

module usbASocketDouble(detail = 1)
{
  translate([0, 0, pcbT/2 + usbADoubleSocketH/2]) {
    difference() {
      color("silver")
        cube([usbADoubleSocketW, usbADoubleSocketD, usbADoubleSocketH], center=true);
      translate([1.0, 0, (5.31 + 3.45)/2])
        color("black")
          cube([15.1, 12.6, 5.31], center=true);
      translate([1.0, 0, -(5.31 + 3.45)/2])
        color("black")
          cube([15.1, 12.6, 5.31], center=true);
      translate([-3, 0, usbADoubleSocketH/2 - 0.5])
        rotate([0, 0, 90])
          linear_extrude(height=0.6)
            text("GCT", size=3, halign="center", valign="center");
    }

    translate([1,0,3.45/2+1.46/2+2.64])
      color("white")
        cube([15.1,10,1.46], center=true);

    translate([1,0,-(3.45/2+1.46/2+1.21)])
      color("white")
        cube([15.1,10,1.46], center=true);
  }
}

module usbMicroSocket(detail = 1)
{
  translate([0, 0, pcbT/2 + usbMicroSocketH/2]) {
    difference() {
      color("silver")
        cube([usbMicroSocketW, usbMicroSocketD, usbMicroSocketH], center=true);
      color("black") {
        hull() {
          translate([0.5, 0, usbMicroTrapezeH/2])
            cube([usbMicroSocketW - 0.9, usbMicroPlugD, usbMicroPlugH - usbMicroTrapezeH], center=true);
          translate([0.5, 0, -(usbMicroPlugH - usbMicroTrapezeH)/2])
            cube([usbMicroSocketW - 0.9, usbMicroPlugD - 2.0, usbMicroTrapezeH], center=true);
        }
      }
    }
    translate([0.5, 0, 0.2]) {
      color("white")
        cube([usbMicroSocketW - 0.9, usbMicroPlugD - 2.0, 0.4], center=true);
    }
  }
}

module hdmiSocket(detail = 1)
{
  translate([0, 0, pcbT/2 + hdmiSocketH/2]) {
    difference() {
      color("silver")
        cube([hdmiSocketW, hdmiSocketD, hdmiSocketH], center=true);
      color("black") {
        hull() {
          translate([0.5, 0, hdmiTrapezeH/2])
            cube([hdmiSocketW - 0.9, hdmiPlugD, hdmiPlugH - hdmiTrapezeH], center=true);
          translate([0.5, 0, -(hdmiPlugH - hdmiTrapezeH)/2])
            cube([hdmiSocketW - 0.9, hdmiPlugD - 2.0, hdmiTrapezeH], center=true);
        }
      }
    }
    translate([0.5, 0, 0.4]) {
      color("white")
        cube([hdmiSocketW - 0.9, hdmiPlugD - 2.0, 1], center=true);
    }
    // translate([0, 15, 0]) {
    //   hdmiPlug();
    // }
  }
}

module hdmiPlug(detail = 1)
{
  difference() {
    color("silver") {
      hull() {
        translate([0, 0, hdmiTrapezeH/2])
          cube([hdmiPlugW, hdmiPlugD, hdmiPlugH - hdmiTrapezeH], center=true);
        translate([0, 0, -(hdmiPlugH - hdmiTrapezeH)/2])
          cube([hdmiPlugW, hdmiPlugD - 2.0, hdmiTrapezeH], center=true);
      }
    }
    translate([1, 0, 0.4]) {
      color("black")
        cube([hdmiPlugW, hdmiPlugD - 2.0, 1], center=true);
    }
  }
}

module hdmiMiniSocket(detail = 1)
{
  translate([0, 0, pcbT/2 + hdmiMiniSocketH/2]) {
    difference() {
      color("silver")
        cube([hdmiMiniSocketW, hdmiMiniSocketD, hdmiMiniSocketH], center=true);
      color("black") {
        hull() {
          translate([0.5, 0, hdmiMiniTrapezeH/2])
            cube([hdmiMiniSocketW-0.9, hdmiMiniPlugD, hdmiMiniPlugH - hdmiMiniTrapezeH], center=true);
          translate([0.5, 0, -(hdmiMiniPlugH-hdmiMiniTrapezeH)/2])
            cube([hdmiMiniSocketW - 0.9, hdmiMiniPlugD - 2.0, hdmiMiniTrapezeH], center=true);
        }
      }
    }
    translate([0.5, 0, 0.2]) {
      color("white")
        cube([hdmiMiniSocketW - 0.9, hdmiMiniPlugD - 2.0, 0.58], center=true);
    }
    // translate([0, 15, 0]) {
    //   hdmiMiniPlug();
    // }
  }
}

module hdmiMicroSocket(detail = 1)
{
  translate([0, 0, pcbT/2 + hdmiMicroSocketH/2]) {
    difference() {
      color("silver")
        cube([hdmiMicroSocketW, hdmiMicroSocketD, hdmiMicroSocketH], center=true);
      color("black") {
        hull() {
          translate([0.5, 0, hdmiMicroTrapezeH/2])
            cube([hdmiMicroSocketW - 0.9, hdmiMicroPlugD, hdmiMicroPlugH - hdmiMicroTrapezeH], center=true);
          translate([0.5, 0, -(hdmiMiniPlugH-hdmiMicroTrapezeH)/2])
            cube([hdmiMicroSocketW - 0.9, hdmiMicroPlugD - 1.0, hdmiMicroTrapezeH], center=true);
        }
      }
    }
    translate([0.5, 0, 0]) {
      color("white")
        cube([hdmiMicroSocketW - 0.9, hdmiMicroPlugD - 1.0, 0.6], center=true);
    }
    // translate([0, 15, 0]) {
    //   hdmiMicroPlug();
    // }
  }
}

module audioSocket(detail = 1)
{
  translate([0, 0, pcbT/2 + audioSocketH/2]) {
    difference() {
      color("darkgrey") {
        cube([audioSocketW, audioSocketD, audioSocketH], center=true);
        translate([audioSocketW/2 + 2.8/2, 0, 0])
          rotate([0, 90, 0])
            cylinder(r=audioSocketR, h=2.8, center=true);
      }
      translate([audioSocketW/2 + 6.1/2 + 0.1, 0, 0])
        color("black")
          rotate([0, 90, 0])
            cylinder(d=3.5, h=6.1, center=true);
    }
  }
}

// Ribbon cable connector horizontal
module connectRibbonHorizontal(width, detail = 1)
{
  translate([0, 0, pcbT/2 + ribbonConnectorD/2]) {
    color("white")
      cube([width, ribbonConnectorH, ribbonConnectorD], center=true);
    translate([0, -1.8, 2])
      color("black")
        cube([width - 4.0, 2, 1.5], center=true);
  }
}

// Ribbon cable connector vertical
module connectRibbonVertical(width, detail = 1)
{
  translate([0, 0, pcbT/2 + ribbonConnectorH/2]) {
    color("white")
      cube([width, ribbonConnectorD, ribbonConnectorH], center=true);
    translate([0, -2, 2])
      color("black")
        cube([width - 4.0, 2, 1.5], center=true);
  }
}

module microSDCardSlot(detail = 1)
{
  translate([0,0,pcbT/2+1.5/2]) {
    color("silver")
      cube([13,14,1.5], center=true);
    translate([13/2+2.4/2,0,0])
      color("darkgrey")
        cube([2.4,11,1], center=true);
  }
}

module bcm2837(heatSink=false, detail = 1)
{
  translate([0,0,pcbT/2+2/2]) {
    color("silver") cube([14,14,2], center=true);
    if (heatSink == true) {
      translate([0,0,1])
        heatSink(x=14, y=14, z=5, wings=7);
    }
    else {
      translate([0,2,1])
        color("black")
          linear_extrude(height=0.1)
            text("BROADCOM", size=1, halign="center", valign="center");
      translate([0,-2,1])
        color("black")
          linear_extrude(height=0.1)
            text("BCM2837B0", size=1, halign="center", valign="center");
    }
  }
}

module bcm2711(heatSink=false, detail = 1)
{
  translate([0,0,pcbT/2+2/2]) {
    color("silver") cube([15.0,15.0,2], center=true);
    if (heatSink == true) {
      translate([0,0,1])
        heatSink(x=15.2, y=15.2, z=5, wings=7);
    }
    else {
      translate([0,2,1])
        color("black")
          linear_extrude(height=0.1)
            text("BROADCOM", size=1, halign="center", valign="center");
      translate([0,-2,1])
        color("black")
          linear_extrude(height=0.1)
            text("BCM2711B0", size=1, halign="center", valign="center");
    }
  }
}

module sdram(detail = 1)
{
  translate([0,0,pcbT/2+2/2]) {
    color("silver") cube([10.0,15.0,2], center=true);
    translate([0,2,1])
      color("black")
        linear_extrude(height=0.1)
          text("Micron", size=1, halign="center", valign="center");
    translate([0,-2,1])
      color("black")
        linear_extrude(height=0.1)
          text("D9WHV", size=1, halign="center", valign="center");
  }
}

// Raspberry Pi 3 GBit LAN
module lan7515(heatSink=false, detail = 1)
{
  translate([0,0,pcbT/2+2/2]) {
    color("silver") cube([11,11,2], center=true);
    if (heatSink == true) {
      translate([0,0,1])
        heatSink(x=11, y=11, z=5, wings=5);
    }
    else {
      translate([0,2,1])
        color("black")
          linear_extrude(height=0.1)
            text("M", size=2, halign="center", valign="center");
      translate([0,-2,1])
        color("black")
          linear_extrude(height=0.1)
            text("LAN7515", size=1, halign="center", valign="center");
    }
  }
}

// Raspberry Pi 4 GBit LAN Port
module bcm54213pe(heatSink=false, detail = 1)
{
  translate([0,0,pcbT/2+2/2]) {
    color("silver") cube([6.0,6.0,2], center=true);
    if (heatSink == true) {
      translate([0,0,1])
        heatSink(x=6.0, y=6.0, z=5, wings=3);
    }
    else {
      translate([0,0,1])
        color("black")
          linear_extrude(height=0.1)
            text("BMC54213PE", size=0.5, halign="center", valign="center");
    }
  }
}

// Raspberry Pi 4 USB 3 Ports
module vl805q6(heatSink=false, detail = 1)
{
  translate([0,0,pcbT/2+2/2]) {
    color("silver") cube([8.0,8.0,2], center=true);
    if (heatSink == true) {
      translate([0,0,1])
        heatSink(x=8.0, y=8.0, z=5, wings=4);
    }
    else {
      translate([0,2,1])
        color("black")
          linear_extrude(height=0.1)
            text("VIA", size=2, halign="center", valign="center");
      translate([0,-2,1])
        color("black")
          linear_extrude(height=0.1)
            text("VL805-Q6", size=1, halign="center", valign="center");
    }
  }
}

// Power supply
module mxl7704(heatSink=false, detail = 1)
{
  translate([0,0,pcbT/2+0.65/2]) {
    color("silver") cube([3.65,3.65,0.85], center=true);
    if (heatSink == true) {
    }
    else {
      translate([0,0.5,0.4])
        color("black")
          linear_extrude(height=0.1)
            text("MxL", size=0.5, halign="center", valign="center");
      translate([0,-0.5,0.4])
        color("black")
          linear_extrude(height=0.1)
            text("MXL7704", size=0.5, halign="center", valign="center");
    }
  }
}

// WLAN and Bluetooth
module cyw43455(detail = 1)
{
  translate([0,0,pcbT/2+4/2]) {
    color("silver")
      cube([10.5,13,4], center=true);
  }
}

module heatSink(x=15, y=15, z=10, wings=5)
{
  paste = 0.4;
  thickness = 1;
  delta = (x-thickness)/(wings-1);

  translate([0,0,paste/2]) {
    color("blue")
      cube([x-paste,y-paste,paste], center=true);
  }
  translate([0,0,thickness/2+paste]) {
    color("silver") {
      cube([x,y,thickness], center=true);
      for(i=[0:wings-1]) {
        translate([-x/2+thickness/2+i*delta,0,z/2-thickness/2])
          cube([thickness,y,z], center=true);
      }
    }
  }
}

module xlrShell()
{
  difference () {
    color("blue") {
      translate([2.7/2,0,0])
        rotate([90,0,90])
          cylinder(h=2.7, d=22, center=true);
      translate([-6.0/2,-19.8/2,19.8/2])
        rotate([90,0,90])
          cylinder(h=6.0, d=5.2, center=true);
      translate([-6.0/2,19.8/2,-19.8/2])
        rotate([90,0,90])
          cylinder(h=6.0, d=5.2, center=true);
      translate([-12.8/2,0,0])
        cube([12.8,14.6,14.6], center=true);
      translate([-1.6/2,0,0])
        rotate([90,0,90])
          hull() {
            translate([19.8/2,-19.8/2,0])
              cylinder(h=1.6, d=5.2, center=true);
            translate([-19.8/2,19.8/2,0])
              cylinder(h=1.6, d=5.2, center=true);
            cylinder(h=1.6, d=25.0, center=true);
          }
    }

    translate([-6.0/2,-19.8/2,19.8/2])
      rotate([90,0,90])
        cylinder(h=6.0, d=3.2, center=true);
    translate([-6.0/2,19.8/2,-19.8/2])
      rotate([90,0,90])
        cylinder(h=6.0, d=3.2, center=true);
  }
}

// Metric ISO threads:
// Diameter | Pitch
//   M1     |  0.25
//   M2     |  0.40
//   M3     |  0.50
//   M4     |  0.70
//   M5     |  0.80
//   M6     |  1.00
//   M8     |  1.25
//   M10    |  1.50
//   ...
function threadPitch(diameter) =
  diameter == 1 ? 0.25
  : diameter == 2 ? 0.40
  : diameter == 3 ? 0.50
  : diameter == 4 ? 0.70
  : diameter == 5 ? 0.80
  : diameter == 6 ? 1.00
  : diameter == 6 ? 1.25
  : 1.50;

module threadedSleeve(thread=false, bushH=10, bushD=8, bushB=4, bushE=8)
{
  p = threadPitch(bushB);
  // echo("Pitch: ", p);

  difference () {
    cylinder(h=bushH, d=bushD, center=true);
    translate([0,0,(bushH-bushE)/2]) {
      if (thread == true) {
        metric_thread(diameter=bushB, pitch=p, length=bushE);
      }
      else {
        cylinder(h=bushE+0.2, d=bushB, center=true);
      }
    }
  }
}

module threadedSleeveCorner(thread=false, bushH=10, bushD=8, bushB=4, bushE=10, cornerR=3, cornerDX=10, cornerDY=8)
{
  p = threadPitch(bushB);
  // echo("Pitch: ", p);

  difference () {
    hull() {
      cylinder(h=bushH, d=bushD, center=true);
      translate([cornerDX-cornerR,cornerDY-cornerR,0])
        cylinder(h=bushH, r=cornerR, center=true);
      translate([cornerDX-helpPointR,-(bushD/2-helpPointR),0])
        cylinder(h=bushH, r=helpPointR, center=true);
      translate([-(bushD/2-helpPointR),cornerDY-helpPointR,0])
        cylinder(h=bushH, r=helpPointR, center=true);
    }

    translate([0,0,(bushH-bushE)/2+0.05]) {
      if (thread == true) {
        metric_thread(diameter=bushB, pitch=p, length=bushE);
      }
      else {
        cylinder(h=bushE+0.2, d=bushB, center=true);
      }
    }
  }
}

module threadedSleeveBorder(thread=false, bushH=10, bushD=8, bushB=4, bushE=8, cornerDX=10)
{
  p = threadPitch(bushB);
  // echo("Pitch: ", p);

  difference () {
    hull() {
      cylinder(h=bushH, d=bushD, center=true);
      translate([cornerDX-helpPointR,-(bushD/2-helpPointR),0])
        cylinder(h=bushH, r=helpPointR, center=true);
      translate([cornerDX-helpPointR,bushD/2-helpPointR,0])
        cylinder(h=bushH, r=helpPointR, center=true);
    }
    translate([0,0,(bushH-bushE)/2]) {
      if (thread == true) {
        metric_thread(diameter=bushB, pitch=p, length=bushE);
      }
      else {
        cylinder(h=bushE+0.2, d=bushB, center=true);
      }
    }
  }
}

module screwNut(bushH=10, bushD=8, bushB=4)
{
  difference () {
    cylinder(h=bushH, d=bushD, center=true);
    cylinder(h=bushH, d=bushB, center=true);
  }
}

module blockBoltHead(blockX=20, blockY=20, blockZ=5, blockR=5, bushH=20, bushD=8, bushB=4)
{
  difference () {
    color("blue") {
      hull() {
        translate([blockX/2-blockR,blockY/2-blockR,0])
          cylinder(h=blockZ, r=blockR, center=true);
        translate([blockX/2-blockR,blockR-blockY/2,0])
          cylinder(h=blockZ, r=blockR, center=true);
        translate([blockR-blockX/2,blockR-blockY/2,0])
          cylinder(h=blockZ, r=blockR, center=true);
        translate([blockR-blockX/2,blockY/2-blockR,0])
          cylinder(h=blockZ, r=blockR, center=true);
      }

      translate([0,0,bushH/2-blockZ/2]) {
        hull() {
          cylinder(h=bushH, d=bushD, center=true);
          translate([blockX/2-blockR,blockY/2-blockR,0])
            cylinder(h=bushH, r=blockR, center=true);
          translate([blockX/2-helpPointR,-(bushD/2-helpPointR),0])
            cylinder(h=bushH, r=helpPointR, center=true);
          translate([-(bushD/2-helpPointR),blockY/2-helpPointR,0])
            cylinder(h=bushH, r=helpPointR, center=true);
        }
      }
    }

    translate([0,0,bushH/2-blockZ/2]) {
      cylinder(h=bushH, d=bushB, center=true);
    }
  }
}

module chinch(blockColor)
{
  color(blockColor)
    translate([0,10/2,13.2/2])
      cube([10,10,13.2], center=true);
  color("silver")
    translate([0,-9.75/2,13.2-0.8-8.4/2])
      rotate([-90,0,0])
        cylinder(d=8.4,h=9.75, center=true);
}

module sdrStick()
{
  bodyW = 67.8;
  stepW = 3.0;
  usbW = 13.7;

  cube([bodyW,28.0,14.0], center=true);
  translate([bodyW/2+stepW/2,0,0])
    cube([stepW,25.0,10.0], center=true);

  // USB port
  translate([bodyW/2+stepW+usbW/2,0,0])
    cube([usbW,12.0,5.0], center=true);
}

module sdrStick2()
{
  // cube([69.0,28.0,14.0], center=true);

  stickL = 67.71;
  stickL2 = 3;

  translate([-stickL/2-0.24/2,0,0])
    rotate([0,90,0])
      color("silver")
        cylinder(d=10.4,h=0.24, center=true);

  cubePoints = [
    [ stickL/2,      0, 13.3/2],   // USB port side (0)
    [ stickL/2, 27.8/2,  9.0/2],
    [ stickL/2, 27.8/2, -9.0/2],
    [ stickL/2,      0,-13.3/2],
    [ stickL/2,-27.8/2, -9.0/2],
    [ stickL/2,-27.8/2,  9.0/2],
    [-stickL/2,      0, 15.3/2],   // Antenna port side (6)
    [-stickL/2, 30.0/2, 11.5/2],
    [-stickL/2, 30.0/2,-11.5/2],
    [-stickL/2,      0,-15.3/2],
    [-stickL/2,-30.0/2,-11.5/2],
    [-stickL/2,-30.0/2, 11.5/2]];  // (11)

  cubeFaces = [
    [0,1,2,3,4,5],  // USB port side
    [1,0,6,7],
    [2,1,7,8],
    [3,2,8,9],
    [4,3,9,10],
    [5,4,10,11],
    [0,5,11,6],
    [6,7,8,9,10,11]];  // Antenna port side

  polyhedron(cubePoints,cubeFaces);

  cubePoints2 = [
    [ stickL2/2,      0, 10.0/2],   // USB port side (0)
    [ stickL2/2, 24.3/2,  6.5/2],
    [ stickL2/2, 24.3/2, -6.5/2],
    [ stickL2/2,      0,-10.0/2],
    [ stickL2/2,-24.3/2, -6.5/2],
    [ stickL2/2,-24.3/2,  6.5/2],
    [-stickL2/2,      0, 10.0/2],   // Antenna port side (6)
    [-stickL2/2, 24.3/2,  6.5/2],
    [-stickL2/2, 24.3/2, -6.5/2],
    [-stickL2/2,      0,-10.0/2],
    [-stickL2/2,-24.3/2, -6.5/2],
    [-stickL2/2,-24.3/2,  6.5/2]];  // (11)

  translate([stickL/2+stickL2/2,0,0])
    polyhedron(cubePoints2,cubeFaces);

  // USB port
  translate([stickL/2+stickL2+13.7/2,0,0])
    color("silver")
      cube([13.7,12.0,4.5], center=true);
}

module donut(outerR=5, innerR=3)
{
  circleR = (outerR-innerR)/2;

  rotate_extrude(convexity = 10)
    translate([outerR-circleR, 0, 0])
      circle(r = circleR);
}

module lipo2500()
{
  color("black")
    cube([63.0,50.3,8.1], center = true);
}

module accuNCR18650B()
{
  diameter = 18.5;
  length = 69;

    rotate([0,90,0]) {
      color("black")
        cylinder(d=diameter, h=length, center=true);
      translate([0, 0, length/2])
        color("red")
          cylinder(d=diameter, h=0.1, center=true);
      translate([0, 0, -length/2])
        color("blue")
          cylinder(d=diameter, h=0.1, center=true);
    }
}

// ==============================================================================================

if(displayHeaderMale) {
  headerMale(20, 2, 5, 10, detail);
}
if(displayHeaderFemale) {
  headerFemale(20, 2, 10, detail);
}
if(displayEthernetSocket) {
  ethernetSocket(detail);
}
if(displayUsbASocketDouble) {
  usbASocketDouble(detail);
}
if(displayUsbMicroSocket) {
  usbMicroSocket(detail);
}
if(displayHdmiSocket) {
  hdmiSocket(detail);
}
if(displayHdmiPlug) {
  hdmiPlug(detail);
}
if(displayHdmiMiniSocket) {
  hdmiMiniSocket(detail);
}
if(displayHdmiMicroSocket) {
  hdmiMicroSocket(detail);
}
if(displayAudioSocket) {
  audioSocket(detail);
}
if(displayConnectorRibbonVertical) {
  connectRibbonVertical(22.0, detail);
}
if(displayConnectorRibbonHorizontal) {
  connectRibbonHorizontal(17.0, detail);
}
if(displayMicroSDCardSlot) {
  microSDCardSlot(detail);
}
if(displayBcm2837) {
  bcm2837(heatSink, detail);
}
if(displayBcm2711) {
  bcm2711(heatSink, detail);
}
if(displaySdRam) {
  sdram(detail);
}
if(displayLan7515) {
  lan7515(heatSink, detail);
}
if(displayBcm54213pe) {
  bcm54213pe(heatSink, detail);
}
if(displayVl805q6) {
  vl805q6(heatSink, detail);
}
if(displayCyw43455) {
  cyw43455(detail);
}
if(displayMxl7704) {
  mxl7704(heatSink, detail);
}
if(displayHeatSink) {
  heatSink();
}
if(displayXlrShell) {
  xlrShell();
}
if(displayThreadedSleeve) {
  threadedSleeve(true);
}
if(displayThreadedSleeveCorner) {
  threadedSleeveCorner(false);
}
if(displayThreadedSleeveBorder) {
  threadedSleeveBorder(true);
}
if(displayScrewNut) {
  screwNut();
}
if(displayBlockBoltHead) {
  blockBoltHead();
}
if(displayChinch) {
  chinch();
}
if(displaySdrStick) {
  sdrStick2();
}
if(displayDonut) {
  donut();
}
if(displayLipo2500) {
  lipo2500();
}
if(displayAccuNCR18650B) {
  accuNCR18650B();
}
