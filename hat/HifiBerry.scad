// ========================================
// Raspberry Pi HAT Modules
// HifiBerry modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <../raspberry/PiPcbConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../raspberry/PiPcbs.scad>
use <../raspberry/PiParts.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayHifiBerryDacPlus = true;    // HifiBerry DAC+ Pro

// Show Header
header = true; // true: Show Header; false:Don't show Header

module hifiBerryDacPlus(withHeader=false)
{
  pi3HatPcb();

  // Label
  translate([15, 0, pcbT/2]) {
    color("white") linear_extrude(height=0.1)
      text("HifiBerry DAC+", size=2, halign="center", valign="center");
  }

  // Chinch
  translate([0,-pi3HatPcbD/2,pcbT/2]) {
    translate([pi3HatPcbW/2-10/2-7.4-10.0-8.6,0,0]) {
      chinch("white");
    }
    translate([pi3HatPcbW/2-10/2-8.6,0,0]) {
      chinch("red");
    }
  }
  translate([-pi3HatPcbW/2+14.6-7.3/2,pi3HatPcbD/2-18.7+5.3/2,pcbT/2+6.8/2])
    cube([7.3,5.3,6.8], center=true);

  // Header top
  if( withHeader )
    translate([0,pi3HatPcbD/2-pi3HatHoleDY-2*2.54,pcbT/2])
      headerMale(20,2);
}

if(displayHifiBerryDacPlus == true) {
  $fn=100;

  hifiBerryDacPlus(header);
}
