// ========================================
// Raspberry Pi HAT Modules
// Pi Modules UPS Pico HV3.0B+
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <PiModulesConstants.scad>
include <../raspberry/PiPcbConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../raspberry/PiPcbs.scad>
use <../raspberry/PiParts.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayUpsPico = true;    // UPS Pico
displayFan = false;        // The fan

// Show Fan
fan = true; // true: Show Fan; false:Don't show Fan

module upsPicoHv30Bplus(withFan=false)
{
  difference() {
    // Pi3 HAT pcb
    pi3HatPcb(true, true, 10.15, true, 2.0, 7.1);
    // Pico fan boreholes
    translate([picoFanOffsetW, picoFanOffsetD, 0]) {
      // Boreholes for sleeves
      picoFanSleeves(pcbT + 1.0);

      // Pico fan air opening
      picoFanOpening(pcbT + 1.0);
    }
  }

  // Label
  translate([16.0, 15.0, pcbT/2]) {
    rotate([0, 0, 90])
      color("white") linear_extrude(height=0.1) {
        text("UPS Pico", size=2, halign="center", valign="center");
        translate([0, -3.0, 0])
          text("HV3.0B+", size=2, halign="center", valign="center");
      }
  }
  
  translate([-pi3HatPcbW/2 + 9.0, 0, pcbT/2])
    rotate([0, 0, 90])
      headerMale(8.0, 2.0, 2.0, 6.5);

  if(withFan) {
    // The fan is 1.2 mm over the pcb
    translate([picoFanOffsetW, picoFanOffsetD, -(pcbT/2 + 1.2 + picoFanH/2)])
      picoFan();
  }
}

// Boreholes for sleeves
module picoFanSleeves(chassisT)
{
  translate([picoFanHoleX/2, -picoFanHoleY/2, 0])
    cylinder(h=chassisT, d=picoFanHoleD, center=true);
  translate([-picoFanHoleX/2, picoFanHoleY/2, 0])
    cylinder(h=chassisT, d=picoFanHoleD, center=true);
  translate([-picoFanHoleX/2, -picoFanHoleY/2, 0])
    cylinder(h=chassisT, d=picoFanHoleD, center=true);
  translate([picoFanHoleX/2, picoFanHoleY/2, 0])
    cylinder(h=chassisT, d=picoFanHoleD, center=true);
}

// Openings for air movement
module picoFanOpening(chassisT, airD = 2.5)
{
  openingR = 9.5;

  // Boreholes for air
  for(alpha=[150:80/15:210]) {
    translate([openingR*cos(alpha), openingR*sin(alpha), 0])
      cylinder(h=chassisT, d=airD, center=true);
  }

  // Boreholes for air
  for(alpha=[330:80/15:390]) {
    translate([openingR*cos(alpha), openingR*sin(alpha), 0])
      cylinder(h=chassisT, d=airD, center=true);
  }
}

// Pico fan
module picoFan()
{
  color("silver")
  difference() {
    // Outer hull
    hull() {
      translate([picoFanW/2-picoFanR, picoFanD/2-picoFanR, 0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
      translate([picoFanW/2-picoFanR, -picoFanD/2+picoFanR, 0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
      translate([-picoFanW/2+picoFanR, -picoFanD/2+picoFanR, 0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
      translate([-picoFanW/2+picoFanR, picoFanD/2-picoFanR, 0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
    }

    // Boreholes for sleeves
    picoFanSleeves(picoFanH + 0.1);
    // Air opening
    cylinder(h=picoFanH + 0.1, d=picoFanAirOpeningD, center=true);
  }

  // Engine
  color("black") {
    cylinder(h=picoFanH+0.1, d=picoFanEngineD, center=true);
  }
}

// Display the selected modules
if(displayUpsPico == true) {
  $fn=100;

  upsPicoHv30Bplus(fan);
}
if(displayFan == true) {
  $fn=100;

  picoFan();

  translate([0, 0, 10.0])
    picoFanSleeves(5);

  translate([0, 0, 10.0])
      picoFanOpening(5, 5);
}
