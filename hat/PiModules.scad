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
    pi3HatPcb(true, true, 10.15, true, 2, 7.1);
    // Pico fan boreholes
    translate([-pi3HatPcbW/2+26.5, 1, 0])
      picoFanBoreholes(pcbT);
    // Pico fan air opening
    
  }

  // Label
  translate([16, 15, pcbT/2]) {
    rotate([0,0,90])
      color("white") linear_extrude(height=0.1) {
        text("UPS Pico", size=2, halign="center", valign="center");
        translate([0, -3, 0])
          text("HV3.0B+", size=2, halign="center", valign="center");
      }
  }
  
  translate([-pi3HatPcbW/2+9, 0, pcbT/2])
    rotate([0,0,90])
      headerMale(8, 2, 2, 6.5);

  if(withFan) {
    translate([-pi3HatPcbW/2+26.5, 1, -(picoFanH+pcbT)/2])
      picoFan();
  }
}

// Fixing and opening boreholes for the Pico fan
module picoFanBoreholes(caseT)
{
  airD = 2.5;
  openingR = 9.5;

  // Boreholes for air
  for(alpha=[150:80/15:210]) {
    translate([openingR*cos(alpha), openingR*sin(alpha), 0])
      cylinder(h=caseT+1, d=airD, center=true);
  }

  // Boreholes for air
  for(alpha=[330:80/15:390]) {
    translate([openingR*cos(alpha), openingR*sin(alpha), 0])
      cylinder(h=caseT+1, d=airD, center=true);
  }

  // Boreholes for sleeves
  picoFanSleeves(caseT+1);
}

// Boreholes for sleeves
module picoFanSleeves(deep)
{
  translate([ picoFanHoleX/2,-picoFanHoleY/2,0])
    cylinder(h=deep, d=picoFanHoleD, center=true);
  translate([-picoFanHoleX/2, picoFanHoleY/2,0])
    cylinder(h=deep, d=picoFanHoleD, center=true);
  translate([-picoFanHoleX/2,-picoFanHoleY/2,0])
    cylinder(h=deep, d=picoFanHoleD, center=true);
  translate([ picoFanHoleX/2, picoFanHoleY/2,0])
    cylinder(h=deep, d=picoFanHoleD, center=true);
}

// Pico fan
module picoFan()
{
  color("silver")
  difference() {
    // Outer hull
    hull() {
      translate([ picoFanW/2-picoFanR, picoFanD/2-picoFanR,0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
      translate([ picoFanW/2-picoFanR,-picoFanD/2+picoFanR,0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
      translate([-picoFanW/2+picoFanR,-picoFanD/2+picoFanR,0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
      translate([-picoFanW/2+picoFanR, picoFanD/2-picoFanR,0])
        cylinder(h=picoFanH, r=picoFanR, center=true);
    }

    // Boreholes for sleeves
    picoFanSleeves(picoFanH+0.1);
    // Air opening
    cylinder(h=picoFanH+0.1, d=picoFanAirOpeningD, center=true);
  }

  // Engine
  color("black") {
    cylinder(h=picoFanH+0.1, d=picoFanEngineD, center=true);
  }
}

module picoFanOpening(chassisT)
{
  // translate([0,0,0])
    // opening(picoFanH, picoFanW, chassisT);
}

// Display the selected modules
if(displayUpsPico == true) {
  $fn=100;

  upsPicoHv30Bplus(fan);
}
if(displayFan == true) {
  $fn=100;

  picoFan();

  translate([0,0,10])
    picoFanBoreholes(5);

  translate([picoFanW/2-2.5,0,2])
    rotate([0,90,0])
      picoFanOpening(5);
}
