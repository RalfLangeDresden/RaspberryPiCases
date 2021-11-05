// ==================================================
// Raspberry Pi and HAT printed circuit boards
// (c) Ralf Lange, longsoft.de
// ==================================================

// External definitions
include <PiPcbConstants.scad>
include <PiPartConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <PiOpenings.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayPi0Boreholes = false;     // Raspberry PI Zero Boreholes
displayPi0 = false;              // Raspberry PI Zero board
displayPi0Hat = false;           // Raspberry PI Zero HAT board
displayPi3Boreholes = false;     // Raspberry PI 3 Boreholes
displayPi3a = false;             // Raspberry PI3 Model A board
displayPi3b = false;             // Raspberry PI3 Model B board
displayPi3Hat = false;           // Raspberry PI3 HAT board
displayPi4Boreholes = false;     // Raspberry PI 4 Boreholes
displayPi4b = false;             // Raspberry PI4 Model B board
displayPiPicoBoreholes = false;  // Raspberry PI Pico Boreholes
displayPiPico = false;           // Raspberry PI Pico board
displayPiCameraV2 = true;       // Raspberry PI Camera board V2
displayPiCameraHQ = false;       // Raspberry PI Camera beard HD
displayImage = false;            // Display a image with all boards

detail = 1;

// Show Header
header = true;    // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink

// Boreholes for fixing Raspberry Pi Zero screws
module pi0Boreholes(chassisT)
{
  // translate([-pi0HoleDC, 0, 0])
    boreholes(pi0HoleX, pi0HoleY, pi0HoleD, chassisT);
}

// Raspberry Pi Zero printed circuit board
module pi0Pcb(withHeader=false)
{
  // PCB
  color("limegreen") difference() {
    hull() {
      translate([-pi0PcbW/2+pi0PcbR, -pi0PcbD/2+pi0PcbR, 0])
        cylinder(r=pi0PcbR, h=pcbT, center=true);
      translate([-pi0PcbW/2+pi0PcbR,  pi0PcbD/2-pi0PcbR, 0])
        cylinder(r=pi0PcbR, h=pcbT, center=true);
      translate([ pi0PcbW/2-pi0PcbR, -pi0PcbD/2+pi0PcbR, 0])
        cylinder(r=pi0PcbR, h=pcbT, center=true);
      translate([ pi0PcbW/2-pi0PcbR,  pi0PcbD/2-pi0PcbR, 0])
        cylinder(r=pi0PcbR, h=pcbT, center=true);
    }

    // Boreholes
    pi0Boreholes(pcbT+0.1);
  }

  // Header
  if (withHeader)
    translate([0, pi0HoleY/2, pcbT/2])
      headerMale(20, 2, detail);
}

// Raspberry Pi Zero HAT printed circuit board
module pi0HatPcb(socketMaleZ=8.55, withHeader=false, socketFemaleZ=2, pinZ=6.55)
{
  // PCB
  color("blue") {
    difference() {
      hull() {
        translate([-pi0HatPcbW/2+pi0HatPcbR, -pi0HatPcbD/2+pi0HatPcbR, 0])
          cylinder(r=pi0HatPcbR, h=pcbT, center=true);
        translate([-pi0HatPcbW/2+pi0HatPcbR,  pi0HatPcbD/2-pi0HatPcbR, 0])
          cylinder(r=pi0HatPcbR, h=pcbT, center=true);
        translate([ pi0HatPcbW/2-pi0HatPcbR, -pi0HatPcbD/2+pi0HatPcbR, 0])
          cylinder(r=pi0HatPcbR, h=pcbT, center=true);
        translate([ pi0HatPcbW/2-pi0HatPcbR,  pi0HatPcbD/2-pi0HatPcbR, 0])
          cylinder(r=pi0HatPcbR, h=pcbT, center=true);
      }

      // Boreholes
      pi0Boreholes(pcbT+0.1);
    }
  }

  // Header top
  if (withHeader)
    translate([0, pi0HatPcbD/2-pi0HatHoleDY, pcbT/2])
      headerMale(20, 2, socketFemaleZ, pinZ);

  // Header down
  translate([0, pi0HatPcbD/2-pi0HatHoleDY, -pcbT/2])
    rotate([0, 180, 0])
      headerFemale(20, 2, socketMaleZ);
}

// Boreholes for fixing Raspberry Pi 3 screws
module pi3Boreholes(chassisT)
{
  boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, chassisT);
}

// Raspberry Pi 3 Model A printed circuit board
module pi3aPcb(withHeader=false)
{
  // PCB
  color("green") difference() {
    hull() {
      translate([-pi3aPcbW/2+pi3aPcbR, -pi3aPcbD/2+pi3aPcbR, 0])
        cylinder(r=pi3aPcbR, h=pcbT, center=true);
      translate([-pi3aPcbW/2+pi3aPcbR,  pi3aPcbD/2-pi3aPcbR, 0])
        cylinder(r=pi3aPcbR, h=pcbT, center=true);
      translate([ pi3aPcbW/2-pi3aPcbR, -pi3aPcbD/2+pi3aPcbR, 0])
        cylinder(r=pi3aPcbR, h=pcbT, center=true);
      translate([ pi3aPcbW/2-pi3aPcbR,  pi3aPcbD/2-pi3aPcbR, 0])
        cylinder(r=pi3aPcbR, h=pcbT, center=true);
    }

    // Boreholes
    pi3Boreholes(pcbT+0.1);
  }

  // Header
  if (withHeader)
    translate([0, pi3aPcbD/2-pi3bHoleDY, pcbT/2])
      headerMale(20, 2, detail);
}

// Raspberry Pi 3 Model B printed circuit board
module pi3bPcb(withHeader=false)
{
  // PCB
  color("green") difference() {
    hull() {
      translate([-pi3bPcbW/2+pi3bPcbR, -pi3bPcbD/2+pi3bPcbR, 0])
        cylinder(r=pi3bPcbR, h=pcbT, center=true);
      translate([-pi3bPcbW/2+pi3bPcbR,  pi3bPcbD/2-pi3bPcbR, 0])
        cylinder(r=pi3bPcbR, h=pcbT, center=true);
      translate([ pi3bPcbW/2-pi3bPcbR, -pi3bPcbD/2+pi3bPcbR, 0])
        cylinder(r=pi3bPcbR, h=pcbT, center=true);
      translate([ pi3bPcbW/2-pi3bPcbR,  pi3bPcbD/2-pi3bPcbR, 0])
        cylinder(r=pi3bPcbR, h=pcbT, center=true);
    }

    // Boreholes
    translate([-pi3bHoleDC, 0, 0])
      pi3Boreholes(pcbT+0.1);
  }

  // Header
  if (withHeader)
    translate([-pi3bPcbW/2+29+pi3bHoleDX, pi3bPcbD/2-pi3bHoleDY, pcbT/2])
      headerMale(20, 2, detail);
}

// Raspberry Pi 3 HAT printed circuit board
module pi3HatPcb(withCameraSlot=false, withDisplaySlot=false, socketMaleZ=8.55, withHeader=false, socketFemaleZ=2, pinZ=6.55)
{
  // PCB
  color("blue") {
    difference() {
      hull() {
        translate([-pi3HatPcbW/2+pi3HatPcbR, -pi3HatPcbD/2+pi3HatPcbR, 0])
          cylinder(r=pi3HatPcbR, h=pcbT, center=true);
        translate([-pi3HatPcbW/2+pi3HatPcbR,  pi3HatPcbD/2-pi3HatPcbR, 0])
          cylinder(r=pi3HatPcbR, h=pcbT, center=true);
        translate([ pi3HatPcbW/2-pi3HatPcbR, -pi3HatPcbD/2+pi3HatPcbR, 0])
          cylinder(r=pi3HatPcbR, h=pcbT, center=true);
        translate([ pi3HatPcbW/2-pi3HatPcbR,  pi3HatPcbD/2-pi3HatPcbR, 0])
          cylinder(r=pi3HatPcbR, h=pcbT, center=true);
      }

      // Boreholes
      pi3Boreholes(pcbT+0.1);

      // Camera flex slot
      if (withCameraSlot) {
        hull() {
          translate([-pi3HatPcbW/2+45, -pi3HatPcbD/2+11.5-17/2+1, 0])
            cylinder(d=2, h=pcbT+0.1, center=true);
          translate([-pi3HatPcbW/2+45, -pi3HatPcbD/2+11.5+17/2-1, 0])
            cylinder(d=2, h=pcbT+0.1, center=true);
        }
      }

      // Display flex slot
      if (withDisplaySlot) {
        hull() {
          translate([-pi3HatPcbW/2+3.5, -pi3HatPcbD/2+19.5+1, 0])
            cylinder(d=2, h=pcbT+0.1, center=true);
          translate([-pi3HatPcbW/2+3.5, -pi3HatPcbD/2+19.5+17-1, 0])
            cylinder(d=2, h=pcbT+0.1, center=true);
        }
        translate([-pi3HatPcbW/2+3.5/2, -pi3HatPcbD/2+28, 0])
          cube([3.5+0.1,17,pcbT+0.1], center=true);
      }
    }
  }

  // Header top
  if (withHeader)
    translate([0, pi3HatPcbD/2-pi3HatHoleDY, pcbT/2])
      headerMale(20, 2, socketFemaleZ, pinZ);

  // Header down
  translate([0, pi3HatPcbD/2-pi3HatHoleDY, -pcbT/2])
    rotate([0, 180, 0])
      headerFemale(20, 2, socketMaleZ);
}

// Boreholes for fixing Raspberry Pi 4 screws
module pi4Boreholes(chassisT)
{
  boreholes(pi4bHoleX, pi4bHoleY, pi4bHoleD, chassisT);
}

// Raspberry Pi 4 Model B printed circuit board
module pi4bPcb(withHeader=false)
{
  // PCB
  color("green") difference() {
    hull() {
      translate([-pi4bPcbW/2+pi4bPcbR, -pi4bPcbD/2+pi4bPcbR, 0])
        cylinder(r=pi4bPcbR, h=pcbT, center=true);
      translate([-pi4bPcbW/2+pi4bPcbR,  pi4bPcbD/2-pi4bPcbR, 0])
        cylinder(r=pi4bPcbR, h=pcbT, center=true);
      translate([ pi4bPcbW/2-pi4bPcbR, -pi4bPcbD/2+pi4bPcbR, 0])
        cylinder(r=pi4bPcbR, h=pcbT, center=true);
      translate([ pi4bPcbW/2-pi4bPcbR,  pi4bPcbD/2-pi4bPcbR, 0])
        cylinder(r=pi4bPcbR, h=pcbT, center=true);
    }

    // Boreholes
    translate([-pi4bHoleDC, 0, 0])
      pi3Boreholes(pcbT+0.1);
  }

  // Header
  if (withHeader)
    translate([-pi4bPcbW/2+29+pi4bHoleDX, pi4bPcbD/2-pi4bHoleDY, pcbT/2])
      headerMale(20, 2, detail);
}

// Boreholes for fixing Raspberry Pi Pico screws
module piPicoBoreholes(chassisT)
{
  // translate([-piPicoHoleDC, 0, 0])
    boreholes(piPicoHoleX, piPicoHoleY, piPicoHoleD, chassisT);
}

// Raspberry Pi Pico printed circuit board
module piPicoPcb()
{
  // PCB
  color("red") difference() {
    hull() {
      translate([-piPicoPcbW/2+piPicoPcbR, -piPicoPcbD/2+piPicoPcbR, 0])
        cylinder(r=piPicoPcbR, h=pcbT, center=true);
      translate([-piPicoPcbW/2+piPicoPcbR,  piPicoPcbD/2-piPicoPcbR, 0])
        cylinder(r=piPicoPcbR, h=pcbT, center=true);
      translate([ piPicoPcbW/2-piPicoPcbR, -piPicoPcbD/2+piPicoPcbR, 0])
        cylinder(r=piPicoPcbR, h=pcbT, center=true);
      translate([ piPicoPcbW/2-piPicoPcbR,  piPicoPcbD/2-piPicoPcbR, 0])
        cylinder(r=piPicoPcbR, h=pcbT, center=true);
    }

    // Boreholes
    piPicoBoreholes(pcbT+0.1);

    // GPIO boreholes
    for (w=[-19*1.27:2.54:19*1.27]) {
      translate([w,  piPicoGpioD/2, 0])
        cylinder(h=pcbT+0.1, d=1, center=true);
      translate([w,  piPicoPcbD/2, 0])
        cylinder(h=pcbT+0.1, d=1, center=true);
      translate([w, -piPicoGpioD/2, 0])
        cylinder(h=pcbT+0.1, d=1, center=true);
      translate([w, -piPicoPcbD/2, 0])
        cylinder(h=pcbT+0.1, d=1, center=true);
    }

    // ??? boreholes
    for (d=[-1*2.54:2.54:1*2.54]) {
      translate([-piPicoPcbW/2+(21-17.78)/2, d, 0])
        cylinder(h=pcbT+0.1, d=1, center=true);
      translate([-piPicoPcbW/2, d, 0])
        cylinder(h=pcbT+0.1, d=1, center=true);
    }
  }
}

module piCameraV2Pcb()
{
  // PCB
  color("yellow")
    difference() {
      hull() {
        translate([-piCameraV2PcbW/2+piCameraV2PcbR, -piCameraV2PcbD/2+piCameraV2PcbR, 0])
          cylinder(r=piCameraV2PcbR, h=pcbT, center=true);
        translate([-piCameraV2PcbW/2+piCameraV2PcbR,  piCameraV2PcbD/2-piCameraV2PcbR, 0])
          cylinder(r=piCameraV2PcbR, h=pcbT, center=true);
        translate([ piCameraV2PcbW/2-piCameraV2PcbR, -piCameraV2PcbD/2+piCameraV2PcbR, 0])
          cylinder(r=piCameraV2PcbR, h=pcbT, center=true);
        translate([ piCameraV2PcbW/2-piCameraV2PcbR,  piCameraV2PcbD/2-piCameraV2PcbR, 0])
          cylinder(r=piCameraV2PcbR, h=pcbT, center=true);
      }
      
      // Boreholes
      translate([-piCameraV2HoleDC, 0, 0])
        boreholes(piCameraV2HoleX, piCameraV2HoleY, piCameraV2HoleD, pcbT);
    }
}

module piCameraHqPcb()
{
  // PCB
  color("yellow")
    difference() {
      hull() {
        translate([-piCameraHqPcbW/2+piCameraHqPcbR, -piCameraHqPcbD/2+piCameraHqPcbR, 0])
          cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
        translate([-piCameraHqPcbW/2+piCameraHqPcbR,  piCameraHqPcbD/2-piCameraHqPcbR, 0])
          cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
        translate([ piCameraHqPcbW/2-piCameraHqPcbR, -piCameraHqPcbD/2+piCameraHqPcbR, 0])
          cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
        translate([ piCameraHqPcbW/2-piCameraHqPcbR,  piCameraHqPcbD/2-piCameraHqPcbR, 0])
          cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
      }

      // Boreholes
      boreholes(piCameraHqHoleX, piCameraHqHoleY, piCameraHqHoleD, pcbT);
    }
}

// Display the selected modules
if (displayPi0Boreholes == true) {
  $fn=100;

  pi0Boreholes(5);
}
if (displayPi0 == true) {
  $fn=100;

  pi0Pcb(header);
}
if (displayPi0Hat == true) {
  $fn=100;

  pi0HatPcb(8.55, header);
}
if (displayPi3Boreholes == true) {
  $fn=100;

  pi3Boreholes(5);
}
if ( displayPi3a == true) {
  $fn=100;

  pi3aPcb(header);
}
if ( displayPi3b == true) {
  $fn=100;

  pi3bPcb(header);
}
if ( displayPi3Hat == true) {
  $fn=100;

  pi3HatPcb(true, true, 8.55, header);
}
if (displayPi4Boreholes == true) {
  $fn=100;

  pi4Boreholes(5);
}
if ( displayPi4b == true) {
  $fn=100;

  pi4bPcb(header);
}
if (displayPiPicoBoreholes == true) {
  $fn=100;

  piPicoBoreholes(5);
}
if (displayPiPico == true) {
  $fn=100;

  piPicoPcb();
}
if (displayPiCameraV2 == true) {
  $fn=100;

  piCameraV2Pcb();
}
if (displayPiCameraHQ == true) {
  $fn=100;

  piCameraHqPcb();
}
if ( displayImage == true) {
  $fn=100;

  // RaspberryPi Zero
  translate([-pi3aPcbW - pi0PcbW/2 -20.0, pi0PcbD/2, 0]) {
    pi0Pcb(header);

    // Label
    translate([0, 0, pcbT/2]) {
      color("white") linear_extrude(height=0.1)
        text("Raspberry Pi Zero", size=3, halign="center", valign="center");
    }
  }
  
  // RaspberryPi 0 HAT
  translate([-pi3aPcbW - pi0PcbW/2 - 20.0, -pi0PcbD/2 - 10.0, 0]) {
    pi0HatPcb(8.55, header);

    // Label
    translate([0, 0, pcbT/2]) {
      color("white") linear_extrude(height=0.1)
        text("Raspberry Pi Zero HAT", size=3, halign="center", valign="center");
    }
  }

  translate([0, pi3bPcbD/2, 0]) {
    // RaspberryPi 3 Model A
    translate([-pi3aPcbW/2 -10, 0, 0]) {
      pi3aPcb(header);

      // Label
      translate([0, 0, pcbT/2]) {
        color("white") linear_extrude(height=0.1)
          text("Raspberry Pi 3 Model A", size=3, halign="center", valign="center");
      }
    }

    // RaspberryPi 3 Model B / B+
    translate([pi3bPcbW/2, 0, 0]) {
      pi3bPcb(header);

      // Label
      translate([0, 0, pcbT/2]) {
        color("white") linear_extrude(height=0.1)
          text("Raspberry Pi 3 Model B / B+", size=3, halign="center", valign="center");
      }
    }
  }

  translate([0, -pi4bPcbD/2-10, 0]) {
    // RaspberryPi 3 HAT
    translate([-pi3aPcbW/2 -10, 0, 0]) {
      pi3HatPcb(true, true, 8.55, header);

      // Label
      translate([0, 0, pcbT/2]) {
        color("white") linear_extrude(height=0.1)
          text("Raspberry Pi 3 HAT", size=3, halign="center", valign="center");
      }
    }

    // RaspberryPi 4 Model B
    translate([pi4bPcbW/2, 0, 0]) {
      pi4bPcb(header);

      // Label
      translate([0, 0, pcbT/2]) {
        color("white") linear_extrude(height=0.1)
          text("Raspberry Pi 4 Model B", size=3, halign="center", valign="center");
      }
    }
  }

  // RaspberryPi Pico
  translate([-pi3aPcbW - piPicoPcbW/2 - 20.0, -pi0PcbD - piPicoPcbD/2 - 20.0, 0]) {
    piPicoPcb();

    // Label
    translate([0, 0, pcbT/2]) {
      color("white") linear_extrude(height=0.1)
        text("Raspberry Pi Pico", size=3, halign="center", valign="center");
    }
  }
  
  // Raspberry Camera Module V2
  translate([pi3bPcbW + piCameraV2PcbW/2 + 10.0, piCameraV2PcbW/2, 0]) {
    piCameraV2Pcb();

    // Label
    translate([0, 5, pcbT/2]) {
      color("black") linear_extrude(height=0.1)
        text("Raspberry", size=3, halign="center", valign="center");
    }
    translate([0, 0, pcbT/2]) {
      color("black") linear_extrude(height=0.1)
        text("Camera", size=3, halign="center", valign="center");
    }
    translate([0, -5, pcbT/2]) {
      color("black") linear_extrude(height=0.1)
        text("V2", size=3, halign="center", valign="center");
    }
  }
  
  // Raspberry Camera Module HQ
  translate([pi4bPcbW + piCameraHqPcbW/2 + 10, -piCameraHqPcbW/2 - 10.0, 0]) {
    piCameraHqPcb();

    // Label
    translate([0, 5, pcbT/2]) {
      color("black") linear_extrude(height=0.1)
        text("Raspberry", size=3, halign="center", valign="center");
    }
    translate([0, 0, pcbT/2]) {
      color("black") linear_extrude(height=0.1)
        text("Camera", size=3, halign="center", valign="center");
    }
    translate([0, -5, pcbT/2]) {
      color("black") linear_extrude(height=0.1)
        text("HD", size=3, halign="center", valign="center");
    }
  }
}
