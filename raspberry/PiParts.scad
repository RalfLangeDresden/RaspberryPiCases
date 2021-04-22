// ========================================
// Raspberry Pi 3 B+ and HAT basic parts
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Pi3Constants.scad>
include <PiPartConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <PiOpenings.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayFan = false;

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink

// Constants
cornerR = 2.0;

// Fixing and opening boreholes for the Pi Fan
module piFanBoreholes(caseT)
{
  airD = piFanAirOpeningD/2-piFanEngineD/2+1.5;
  openingR = (piFanAirOpeningD/2+piFanEngineD/2)/2;

  // Boreholes for air
  for(alpha=[22.5:360/8:359]) {
    translate([openingR*cos(alpha), openingR*sin(alpha), 0])
      cylinder(h=caseT+1, d=airD, center=true);
    // echo(alpha);
  }

  // Boreholes for sleeves
  piFanSleeves(caseT+1);
}

// Boreholes for sleeves
module piFanSleeves(deep)
{
  translate([ piFanHoleX/2,-piFanHoleY/2,0])
    cylinder(h=deep, d=piFanHoleD, center=true);
  translate([-piFanHoleX/2, piFanHoleY/2,0])
    cylinder(h=deep, d=piFanHoleD, center=true);
  translate([-piFanHoleX/2,-piFanHoleY/2,0])
    cylinder(h=deep, d=piFanHoleD, center=true);
  translate([ piFanHoleX/2, piFanHoleY/2,0])
    cylinder(h=deep, d=piFanHoleD, center=true);
}

// Pi Fan
module piFan()
{
  color("silver")
  difference() {
    // Outer hull
    hull() {
      translate([ piFanW/2-piFanR, piFanD/2-piFanR,0])
        cylinder(h=piFanH, r=piFanR, center=true);
      translate([ piFanW/2-piFanR,-piFanD/2+piFanR,0])
        cylinder(h=piFanH, r=piFanR, center=true);
      translate([-piFanW/2+piFanR,-piFanD/2+piFanR,0])
        cylinder(h=piFanH, r=piFanR, center=true);
      translate([-piFanW/2+piFanR, piFanD/2-piFanR,0])
        cylinder(h=piFanH, r=piFanR, center=true);
    }

    // Boreholes for sleeves
    piFanSleeves(piFanH+0.1);
    // Air opening
    cylinder(h=piFanH+0.1, d=piFanAirOpeningD, center=true);
  }

  // Engine
  color("black") {
    cylinder(h=piFanH+0.1, d=piFanEngineD, center=true);
  }
}

module piFanOpening(chassisT)
{
  translate([0,0,0])
    opening(piFanH, piFanW, chassisT);
}

// Display the selected modules
if(displayFan == true) {
  $fn=100;

  piFan();

  translate([0,0,10])
    piFanBoreholes(5);

  translate([piFanW/2-2.5,0,2])
    rotate([0,90,0])
      piFanOpening(5);
}
